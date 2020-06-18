
//If the current battle stage is done, transition to the next one.
if(BattleStageEnd)
{
	BattleStage++;
	show_debug_message("BattleStage: "+string(BattleStage));
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
		break;
		
		case 3:
			//Player turn
			with(oBattleMenuParent)
			{
				visible = true;
			}
			BattleTimer = BattleTimerInit*60;
		break;
		
		case 4:
			//Update Stats
			timer[0] = 0.5*60;
			visible = true;
		break;
		
		case 5:
			//CHATTER BEFORE LOOP
			visible = false;
			var EnemyText = EnemyBattle.TextDuring[random_range(0,array_length_1d(EnemyBattle.TextDuring))];
			scrCreateBattleBox(EnemyText);
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
if(BattleTimer > 0 && visible && BattleStage == 3)
{
	BattleTimer -= 1;
	if (BattleTimer <= 0)
	{
		BattleStageEnd = true;
		with(oBattleMenuParent)
        {
            visible = false;
            Selected = false;
        }
        visible = false;
	}
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
	
	//If all checks done, go to next phase
	if(Check == 3 && timer[0] == -1)
		timer[0] = 0.5*60;
}

//timer management
if(timer[0] > 0)
{
	timer[0] -= 1;
}
else if(timer[0] != -1)
{
	timer[0] = -1;
	if(UpdateStats)
	{
		UpdateStats = false;
		if(BattleStage == 2 || BattleStage == 4)
			BattleStageEnd = true;
	}
	else
	{
		UpdateStats = true;
	}
	if(DrawPlayerHealth > global.PlayerHP)
	{
		Shake[0] = 8;
	}
	if(DrawEnemyHealth > EnemyBattle.Health)
	{
		Shake[1] = 10;
	}
	
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