
if(BattleStageEnd)
{
	BattleStage++;
	if(BattleStage > 3)
	{
		BattleStage = 1;
	}

	switch(BattleStage) {
		case 1:
			instance_create_layer(0,0,"GameManager",oMiniGame);
		break;
		
		case 2:
			var BattleText = instance_create_layer(x,y,"text",oBattleTextBox); 
			BattleText.text = ["(You Attack)"];
		break;
		
		case 3:
			var EnemyTextDuring = Enemy.TextDuring[random_range(0,array_length_1d(Enemy.TextDuring))];
			var BattleText = instance_create_layer(x,y,"text",oBattleTextBox); 
			BattleText.text = [EnemyTextDuring];
		break;
	}
	BattleStageEnd = false;
}