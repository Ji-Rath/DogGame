/// @description Insert description here
// You can write your code in this editor

CalculatePosition();
ShiftEnemies(true, 0);
var EnemyInfo = ds_list_find_value(oBattleManager.EnemyInfo, oBattleManager.GetEnemyIndex(id));
RemoveInstance(EnemyInfo.ObjectIndex, EnemyInfo.InstanceID);
oBattleManager.DeleteEnemy(id);

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