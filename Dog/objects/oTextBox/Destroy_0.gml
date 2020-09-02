
if(!variable_instance_exists(self, "Seq")) exit;

if(variable_instance_exists(self, "EndTurn") && instance_exists(oBattleManager))
{
    oBattleManager.BattleStageEnd = EndTurn;
	if(!EndTurn)
	{
		oBattleManager.timer[0] = 0.5*60;
	}
}

layer_sequence_destroy(Seq);