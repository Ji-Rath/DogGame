/// @description Insert description here
// You can write your code in this editor

CalculatePosition();
var Inst = ds_list_find_value(oBattleManager.EnemyInfo, oBattleManager.GetEnemyIndex(self));
RemoveInstance("Enemy", Inst);

if(instance_number(oEnemyBattleParent) <= 1)
{
	with(oBattleManager)
	{
		BattleStage = BattleSection.RoomTransition;
		RunBattleStage();
	}
}
else
{
	oBattleManager.NextTurn();	
}