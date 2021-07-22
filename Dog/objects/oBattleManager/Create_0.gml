/// @description Insert description here
// You can write your code in this editor

SpeedMultiplier = 0.8;

//Battle timer values
BattleTimerInit = 15; //Time for player turn (seconds) - Multiplied by speed multiplier
BarWidth = 400; //Width of timer rectangle

//////////////////////////////////////////////////////////////////////////////////////////

enum BattleSection
{
	EnemyAttack,
	PlayerAttack,
	PlayerDead,
	PlayerVictory,
	RoomTransition
}

/// @func NextTurn(Delay = 0.1);
/// @desc Swap turns and check HP of both opponents
function NextTurn()
{
	var Delay = argument_count > 0 ? argument[0] : 0.1;
	alarm[0] = (Delay*60)*SpeedMultiplier;
		
	switch(BattleStage)
	{
		case BattleSection.EnemyAttack:
			FocusedEnemy++;
			if (FocusedEnemy >= ds_list_size(EnemyBattle))
			{
				BattleStage = BattleSection.PlayerAttack;
				FocusedEnemy = 0;
			}
			break;
		case BattleSection.PlayerAttack: 
			BattleStage = BattleSection.EnemyAttack;
			
			// Wait slightly longer after enemy death
			with (oEnemyBattleParent)
			{
				if (Health <= 0)
					other.alarm[0] = 1*60;
			}
			break;
	}
	
	//Check enemy and player health
	if(oBattlePlayer.DisplayHealth <= 0 && BattleStage != BattleSection.PlayerDead)
		BattleStage = BattleSection.PlayerDead;
		
	switch(BattleStage)
	{
		case BattleSection.EnemyAttack:
			CreateBattleTextEvent(ds_list_find_value(EnemyInfo, FocusedEnemy).TextFile, "Battle", true);
			break;
	}
}

/// @desc Implementation of spawning minigame, showing UI on player turn, etc
function RunBattleStage()
{
	switch(BattleStage)
	{
		case BattleSection.EnemyAttack: //Enemy turn, send enemy minigame
			// Handle MissileBoy blockable attacks
			if (instance_exists(oBattleMissileBoy) && oBattleMissileBoy.CanBlockAttack())
			{
				oBattleMissileBoy.Blocks--;
				scrRunSequence(seqShieldDefend);
				NextTurn(1);
			}
			else
			{
				GetFocusedEnemy().PerformTurn();
			}
			break;
		
		case BattleSection.PlayerAttack: //Player turn
			BattleTimer = BattleTimerInit*60;
			//BattleTimer *= SpeedMultiplier;
			DrawTimer = BattleTimer;
			
			if(global.PlayerPP <= 0)
				global.PlayerHP -= 5;
				
			//Increase rage
			oBattlePlayer.Rage ++;
			
			//Player turn
			DrawGUI = true;
			
			with(oBattleMenuBase)
				TweenPlay(FadeIn);
				
			with(oBattleCharBase)
				TweenPlay(FadeIn);
			break;
		
		case BattleSection.PlayerVictory:
			//Handled in oEnemyBattleParent
			break;
		
		case BattleSection.RoomTransition:
			//PLAYER WINS
			var Room = ds_map_find_value(oAreaStats.SaveState,"Room");
			scrFadeout(Room,c_black,0.05);
			break;
		
		case BattleSection.PlayerDead:
			//PLAYER LOSES
			scrFadeout(rmGameOver,c_red,0.01);
			break;
	}	
}

function GetFocusedEnemy()
{
	var Inst = ds_list_find_value(EnemyBattle, FocusedEnemy);
	if (Inst != undefined)
		return Inst.id;
	return undefined;
}

function GetEnemyIndex(Inst)
{
	return ds_list_find_index(EnemyBattle, Inst);
}

function DeleteEnemy(Enemy)
{
	var Index = ds_list_find_index(EnemyBattle, Enemy);
	ds_list_delete(EnemyBattle, Index);
	ds_list_delete(EnemyInfo, Index);
}

/// @func AddEnemy(Enemy, Count=1);
/// @desc Add an enemy to the battle scene
/// @arg {obj} Enemy
/// @arg {int} Count=1
function AddEnemy(Enemy)
{
	var Count = argument_count > 1 ? argument[1] : 1;
	
	if (instance_number(oEnemyBattleParent)+Count <= 3)
	{
		repeat(Count)
		{
			var Inst = instance_create_layer(-1000, -1000, "Instances", Enemy);
			ds_list_add(EnemyInfo, Inst.BattleInfo);
			ds_list_add(EnemyBattle, instance_create_layer(640, 390, "Instances", Inst.BattleInfo.BattleObject));
			instance_destroy(Inst);
		}
		oEnemyBattleParent.CalculatePosition();
	}
}

// Create 'data manager' in the event that it does not exist for some reason (debug)
if (!instance_exists(oAreaStats))
	instance_create_layer(0, 0, "Instances", oAreaStats);

//Initialize Itembar variables
scrItems();

// Create Battle Enemies
EnemyInfo = oAreaStats.EnemyInfo;
FocusedEnemy = 0;
EnemyBattle = ds_list_create();
for (var i=0;i<ds_list_size(EnemyInfo);i++)
{
	//Create Enemy Object
	var Inst = instance_create_layer(640, 390, "Instances", ds_list_find_value(EnemyInfo, i).BattleObject);
	ds_list_add(EnemyBattle, Inst);
}
oEnemyBattleParent.CalculatePosition();

// Create Player and Allies
instance_create_layer(0, 0, "GUI", oBattlePlayer);
for (var i=0;i<ds_list_size(oAreaStats.AllyInfo);i++)
{
	instance_create_layer(0, 0, "GUI", ds_list_find_value(oAreaStats.AllyInfo, i));	
}
oBattleCharBase.CalculatePosition();

instance_create_layer(0, 0, "GUI", oBattleMenuAttack);
instance_create_layer(0, 0, "GUI", oBattleMenuBag);

//Current battle stage
BattleStage = BattleSection.PlayerAttack;

Alpha = 0;

//Timer Bar
BattleTimer = 0;

//Update stats effect
DrawTimer = BattleTimer;
timer[0] = -1;

//Shake effect
for(i=0;i<2;i++)
{
	Shake[i] = 0;
}

DrawGUI = false;
bHasShiftedEnemies = false;

//Proceed to start turn
NextTurn(0.5);