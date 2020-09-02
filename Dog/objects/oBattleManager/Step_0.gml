
//Increment neglect at a rate of 1 per second
if(NeglectMeter <= MaxNeglect && !instance_exists(oTextBox))
{
	NeglectMeter += (1/60);
}

//If the current battle stage is done, transition to the next one.
if(BattleStageEnd)
{
	BattleStage++;
	if(BattleStage == 6)
	{
		BattleStage = 1;
	}
	
	//Check enemy and player health
	if(DrawPlayerHealth <= 0 && BattleStage < 6)
	{
		BattleStage = 9;
	}
	
	if(DrawEnemyHealth <= 0 && BattleStage < 6)
	{
		BattleStage = 7;
	}
	
	switch(BattleStage)
	{
		case 1:
			//ENEMY ATTACK, SEND OVER THE SPECIFIED MINI GAME
			var MiniGame = instance_create_layer(0,0,"GameManager",oMiniGame);
			MiniGame.GameType = EnemyBattle.EnemyAttacks[random_range(0,array_length_1d(EnemyBattle.EnemyAttacks))]
		break;
		
		case 2:
			//Update Stats
			timer[0] = 0.5*60;
			visible = true;
			DrawGUI = true;
		break;
		
		case 3:
			//Player turn
			with(oBattleMenuBase)
			{
				visible = true;
			}
			DrawGUI = true;
			oButtonHighFive.CanHighfive = true;
		break;
		
		case 4:
			//Update Stats
			timer[0] = 0.5*60;
			visible = true;
			DrawGUI = true;
			if(global.PlayerPP <= 0)
			{
				global.PlayerHP -= 5;
			}
		break;
		
		case 5:
			//CHATTER BEFORE LOOP
			visible = false;
			DrawGUI = false;
			var EnemyText = EnemyBattle.TextDuring[random_range(0,array_length_1d(EnemyBattle.TextDuring))];
			CreateBattleTextEvent(EnemyText, true, new TextInit(0.05, c_black, 1));
		break;
		
		case 7:
			//Victory Text
			
		break;
		
		case 8:
			//PLAYER WINS
			var Room = ds_map_find_value(oAreaStats.SaveState,"Room");
			var EnemyGrid = ds_grid_create(0,0);
			ds_grid_read(EnemyGrid, ds_map_find_value(oAreaStats.SaveState,Room+"Enemy"));
			
			//Find enemy to delete from the room
			for(i=0;i<ds_grid_height(EnemyGrid);i++)
			{
				if(ds_grid_get(EnemyGrid,0,i) == EnemyKey)
				{
					ds_grid_set(EnemyGrid,3,i,0);
					i = ds_grid_height(EnemyGrid);
				}
			}
			ds_map_replace(oAreaStats.SaveState,Room+"Enemy",ds_grid_write(EnemyGrid));
			scrFadeout(asset_get_index(Room),c_black,0.05);
		break;
		
		case 9:
			//PLAYER LOSES
			scrFadeout(rmGameOver,c_red,0.01);
		break;
	}
	BattleStageEnd = false;
}

//Reduce battle timer, and end turn if at 0
if(visible && BattleStage == 3 && DrawTimer == BattleTimer && !instance_exists(oTextBox))
{
	if(BattleTimer > 0)
	{
		BattleTimer -= 1;	
	}
	
	if (BattleTimer <= 0 && !instance_exists(oMiniGame))
	{
		BattleStageEnd = true;
		with(oBattleMenuBase)
        {
            visible = false;
            Selected = false;
        }
        visible = false;
        DrawGUI = false;
	}
	if(BattleStage == 3)
		DrawTimer = BattleTimer;
}

//Update player stats visually if changed
if(UpdateStats)
{
	var Check = 0;
	var Increment = 0.25;
	
	//Check player health for changes
	if(DrawPlayerHealth > global.PlayerHP)
		DrawPlayerHealth -= Increment;
	if(DrawPlayerHealth < global.PlayerHP)
		DrawPlayerHealth += Increment;
	if(DrawPlayerHealth = global.PlayerHP)
		Check++;
	
	//Check player PP for changes
	if(DrawPlayerPP > global.PlayerPP)
		DrawPlayerPP -= Increment;
	if(DrawPlayerPP < global.PlayerPP)
		DrawPlayerPP += Increment;
	if(DrawPlayerPP = global.PlayerPP)
		Check++;
	
	//Check enemy health for changes
	if(DrawEnemyHealth > EnemyBattle.Health)
		DrawEnemyHealth -= Increment;
	if(DrawEnemyHealth < EnemyBattle.Health)
		DrawEnemyHealth += Increment;
	if(DrawEnemyHealth = EnemyBattle.Health)
		Check++;
	
	//Check battle timer for changes
	if(DrawTimer > BattleTimer)
		DrawTimer -= Increment*8;
	if(DrawTimer < BattleTimer)
		DrawTimer += Increment*8;
	if(DrawTimer == BattleTimer)
		Check++;
	
	//If all checks done, go to next phase
	if(Check == 4 && timer[0] == -1)
		timer[0] = 0.5*60;
}

//TIMER MANAGEMENT

//Count how much time the player has left on their turn
if(timer[0] > 0)
{
	timer[0] -= 1;
}
else if(timer[0] != -1)
{
	//Continue to the enemies turn if out of time
	timer[0] = -1;
	if(UpdateStats)
	{
		UpdateStats = false;
		if(BattleStage == 2 || BattleStage == 4)
		{
			BattleStageEnd = true;
			BattleTimer = BattleTimerInit*60;
			DrawTimer = BattleTimer;
		}
	}
	else
	{
		UpdateStats = true;
	}
	
	//Update stats
	if(DrawPlayerHealth > global.PlayerHP)
	{
		Shake[0] = 8;
	}
	if(DrawEnemyHealth > EnemyBattle.Health)
	{
		Shake[1] = 8;
	}
	
	//If enemy is flipped, but them in correct position
	if(oEnemyBattleParent.Vulnerable && BattleStage == 4)
	{
		oEnemyBattleParent.Vulnerable = false;
	}
}

//Shake effect
for(i=0;i<array_length_1d(Shake);i++)
{
	if(Shake[i] > 0)
	{
		Shake[i] /= 1.075;
	}
}