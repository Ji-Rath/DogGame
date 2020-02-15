/// @param Enemy
var Enemy = argument0;

scrGameSave("TempSave.sav");
scrFadeout(rmBattle, c_maroon, 0.025);
oAreaStats.EnemyBattle = Enemy.BattleObject;
oAreaStats.EnemyKey = Enemy.Key;