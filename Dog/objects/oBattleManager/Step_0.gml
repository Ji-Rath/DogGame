
//If the current battle stage is done, transition to the next one.
if(BattleStageEnd)
{
	
	if(Enemy == noone)
	{
		fadeout(room0,c_black,0.05);
		exit;
	}
	
	BattleStage++;
	if(BattleStage > 3)
	{
		BattleStage = 1;
	}
	
	//Check enemy and player health
	if(global.phealth <= 0)
	{
		var BattleText = instance_create_layer(x,y,"text",oBattleTextBox);
		BattleText.text = ["You lose!"];
	}
	
	if(Enemy.Health <= 0)
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
				//PLAYER ATTACK
				var BattleText = instance_create_layer(x,y,"text",oBattleTextBox);
				BattleText.text = choose(["(You punched the "+Enemy.Name+")"],["(You swung at the "+Enemy.Name+")"]);
				Enemy.Health -= 3;
				
				if(irandom(8) = 0)
				{
					BattleText.text = ["You ate the crab :o"]
					Enemy.Health = 0;
					global.phealth += 50;
				}
			break;
			
			case 3:
				//CHATTER BEFORE LOOP
				var BattleText = instance_create_layer(x,y,"text",oBattleTextBox);
				var EnemyTextDuring = Enemy.TextDuring[random_range(0,array_length_1d(Enemy.TextDuring))];
				BattleText.text = [EnemyTextDuring];
			break;
		}
	}
	
	
	BattleStageEnd = false;
}