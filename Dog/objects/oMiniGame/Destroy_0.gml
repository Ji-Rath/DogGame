/// @description Insert description here
// You can write your code in this editor

for(var i=0;i<ds_list_size(Instances);i++)
{
    var Instance = ds_list_find_value(Instances,i);
    if(instance_exists(Instance))
    {
        instance_destroy(Instance);
    }
}


if(EndTurn)
{
	with(oBattleManager)
	{
		// Allow oBattleEnemyParent to handle going to the next turn during death
		if(BattleStage == BattleSection.EnemyAttack)
		{
			if (GetFocusedEnemy().Health > 0)
				NextTurn(1);
		}
		else
		{
			if (GetFocusedEnemy().Health > 0)
				NextTurn(0.5);
		}	
	}
		
}
else //Only show GUI fade in if it was invisible before
{
	oBattleManager.DrawGUI = true;
	if (oBattleMenuBase.image_alpha == 0)
	{
		with(oBattleMenuBase)
			TweenPlay(FadeIn);
		with(oBattleCharBase)
			TweenPlay(FadeIn);
	}
}

layer_sequence_destroy(MiniGameScreenSeq);
layer_sequence_destroy(MiniGameEndSeq);
	