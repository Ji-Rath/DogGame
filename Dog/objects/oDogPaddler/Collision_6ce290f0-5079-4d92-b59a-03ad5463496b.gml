/// @description Insert description here
// You can write your code in this editor

//If enemy collides with player, go to battle scene

//Go to battle scene if enemy is alert
if (other.State == estates.Aggro && other.visible = true)
{
	scrGameSave("TempSave");
	scrFadeout(rmBattle, c_maroon, 0.05);
	oAreaStats.EnemyBattle = other.BattleObject;
	oAreaStats.EnemyKey = other.Key;
}