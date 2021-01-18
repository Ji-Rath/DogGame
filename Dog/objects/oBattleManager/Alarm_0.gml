/// @description Insert description here
// You can write your code in this editor


if (!bHasShiftedEnemies && BattleStage == BattleSection.EnemyAttack && instance_number(oEnemyBattleParent) > 1)
{
	oEnemyBattleParent.ShiftEnemies();
	bHasShiftedEnemies = true;
	alarm[0] = 0.75*60;
	
}
else
{
	DrawGUI = false;
	RunBattleStage();
	bHasShiftedEnemies = false;
}
