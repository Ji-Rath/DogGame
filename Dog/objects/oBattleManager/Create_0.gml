/// @description Insert description here
// You can write your code in this editor

SpeedMultiplier = 0.7;

//Battle timer values
BattleTimerInit = 15; //Time for player turn (seconds) - Multiplied by speed multiplier
BarWidth = 400; //Width of timer rectangle

//Value to trigger rage attack
MaxRage = 4; //Increments every player turn

//Value to trigger neglect effects
MaxNeglect = 30; // (seconds)


//////////////////////////////////////////////////////////////////////////////////////////

// Create 'data manager' in the event that it does not exist for some reason (debug)
if (!instance_exists(oAreaStats))
	instance_create_layer(0, 0, "Instances", oAreaStats);

//Rage meter
RageMeter = 0;

//Initialize Itembar variables
scrItems();

EnemyInfo = oAreaStats.EnemyInfo;
FocusedEnemy = 0;

EnemyBattle = ds_list_create();

for (var i=0;i<ds_list_size(EnemyInfo);i++)
{
	//Create Enemy Object
	ds_list_add(EnemyBattle, instance_create_layer(640, 390, "Instances", ds_list_find_value(EnemyInfo, i).BattleObject));
}
oEnemyBattleParent.CalculatePosition();

//Current battle stage
BattleStage = BattleSection.PlayerAttack;

//Mark player portrait position
DPhpx = 170;
DPhpy = 17;
DPoffy = 50;

Alpha = 0;

//Timer Bar
BattleTimer = 0;

//Update stats effect
UpdateStats = false;
DrawPlayerHealth = global.PlayerHP;
DrawPlayerPP = global.PlayerPP;
DrawTimer = BattleTimer;
timer[0] = -1;

//Shake effect
for(i=0;i<2;i++)
{
	Shake[i] = 0;
}

//Neglect meter
NeglectMeter = 0;

DrawGUI = false;

image_speed = 0.1;

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
	if (alarm[0] > Delay*60 || alarm[0] == -1)
		alarm[0] = Delay*60/SpeedMultiplier;
		
	switch(BattleStage)
	{
		case BattleSection.EnemyAttack:
			FocusedEnemy++;
			oEnemyBattleParent.ShiftEnemies();
			if (FocusedEnemy >= ds_list_size(EnemyBattle))
			{
				BattleStage = BattleSection.PlayerAttack;
				FocusedEnemy = 0;
			}
			break;
		case BattleSection.PlayerAttack: BattleStage = BattleSection.EnemyAttack; break;
	}
	
	//Check enemy and player health
	if(DrawPlayerHealth <= 0 && BattleStage != BattleSection.PlayerDead)
		BattleStage = BattleSection.PlayerDead;
	
	/*
	if(DrawEnemyHealth <= 0 && BattleStage != BattleSection.PlayerVictory && BattleStage != BattleSection.RoomTransition)
		BattleStage = BattleSection.PlayerVictory;
	*/
		
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
			var MiniGame = instance_create_layer(0,0,"GameManager",oMiniGame);
			MiniGame.GameType = GetFocusedEnemy().PickRandomGame();
			break;
		
		case BattleSection.PlayerAttack: //Player turn
			BattleTimer = BattleTimerInit*60;
			DrawTimer = BattleTimer;
			
			if(global.PlayerPP <= 0)
				global.PlayerHP -= 5;
				
			//Increase rage
			oBattleManager.RageMeter += 1;
			
			//Player turn
			DrawGUI = true;
			
			with(oBattleMenuBase)
				scrAnimReinit(Animations.SmoothFlip, Animations.IntroScale);
			break;
		
		break;
		
		case BattleSection.PlayerVictory:
			//Handled in oEnemyBattleParent
			break;
		
		case BattleSection.RoomTransition:
			//PLAYER WINS
			var Room = ds_map_find_value(oAreaStats.SaveState,"Room");
			scrFadeout(asset_get_index(Room),c_black,0.05);
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
	return ds_list_find_index(EnemyInfo, Inst);
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
	static CanAdd = true;
	var Count = argument_count > 1 ? argument[1] : 1;
	
	if (CanAdd)
	{
		repeat(Count)
		{
			var Inst = instance_create_layer(-1000, -1000, "Instances", Enemy);
			ds_list_add(EnemyInfo, Inst.BattleInfo);
			ds_list_add(EnemyBattle, instance_create_layer(640, 390, "Instances", Inst.BattleInfo.BattleObject));
			instance_destroy(Inst);
		}
		oEnemyBattleParent.CalculatePosition();
		CanAdd = false;
	}
}

NextTurn(0.5);