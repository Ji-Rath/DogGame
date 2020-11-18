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
		if(BattleStage == BattleSection.EnemyAttack)
			NextTurn();
		else
			NextTurn(0.5);
	}
		
}
else if(oBattleMenuBase.AnimAlpha == 0) //Only show GUI fade in if it was invisible before
{
	oBattleManager.DrawGUI = true;
	with(oBattleMenuBase)
		scrAnimReinit(Animations.SmoothFlip, Animations.IntroScale);
}

layer_sequence_destroy(MiniGameScreenSeq);
layer_sequence_destroy(MiniGameEndSeq);

	