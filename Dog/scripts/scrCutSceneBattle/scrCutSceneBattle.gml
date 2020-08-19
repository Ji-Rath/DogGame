/// @param Enemy
function scrCutSceneBattle(argument0) {
	var Enemy = argument0;

	scrGameSave("TempSave.sav");
	scrFadeout(rmBattle, c_maroon, 0.05);
	oAreaStats.EnemyBattle = Enemy.BattleObject;
	oAreaStats.EnemyKey = Enemy.Key;


}
