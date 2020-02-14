
//If the current battle stage is done, transition to the next one.
if(BattleStageEnd)
{
	
	if(Enemy == noone)
	{
		scrFadeout(rmTest,c_black,0.05);
		exit;
	}
	
	BattleStage++;
	if(BattleStage > 5)
	{
		BattleStage = 1;
	}
	
	//Check enemy and player health
	if(DrawPlayerHealth <= 0)
	{
		var BattleText = instance_create_layer(x,y,"text",oBattleTextBox);
		BattleText.text = ["You lose!"];
	}
	
	if(DrawEnemyHealth <= 0)
	{
		var BattleText = instance_create_layer(x,y,"text",oBattleTextBox);
		BattleText.text = ["You Win!"];
		Enemy = noone;
		OriginalEnemy.Health = 0;
	}
	else 
	{
		switch(BattleStage)
		{
			case 1:
				//ENEMY ATTACK, SEND OVER THE SPECIFIED MINI GAME
				var MiniGame = instance_create_layer(0,0,"GameManager",oMiniGame);
				MiniGame.GameType = Enemy.EnemyAttacks[random_range(0,array_length_1d(Enemy.EnemyAttacks))]
			break;
			
			case 2:
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
				timer[0] = 0.5*60;
				visible = true;
			break;
			
			case 5:
				//CHATTER BEFORE LOOP
				visible = false;
				var BattleText = instance_create_layer(x,y,"text",oBattleTextBox);
				var EnemyTextDuring = Enemy.TextDuring[random_range(0,array_length_1d(Enemy.TextDuring))];
				BattleText.text = [EnemyTextDuring];
			break;
		}
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

if(UpdateStats)
{
	var Check = 0;
	var Increment = 0.25;
	if(DrawPlayerHealth > global.phealth)
	{
		DrawPlayerHealth -= Increment;
	}
	if(DrawPlayerHealth < global.phealth)
	{
		DrawPlayerHealth += Increment;
	}
	if(DrawPlayerHealth = global.phealth)
	{
		Check++;
	}
	
	if(DrawPlayerPP > global.pp)
	{
		DrawPlayerPP -= Increment;
	}
	if(DrawPlayerPP < global.pp)
	{
		DrawPlayerPP += Increment;
	}
	if(DrawPlayerPP = global.pp)
	{
		Check++;
	}
	
	if(DrawEnemyHealth > Enemy.Health)
	{
		DrawEnemyHealth -= Increment;
	}
	if(DrawEnemyHealth < Enemy.Health)
	{
		DrawEnemyHealth += Increment;
	}
	if(DrawEnemyHealth = Enemy.Health)
	{
		Check++;
	}
	
	if(Check == 3 && timer[0] == -1)
	{
		timer[0] = 0.5*60;
	}
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
		BattleStageEnd = true;
	}
	else
	{
		UpdateStats = true;
	}
}