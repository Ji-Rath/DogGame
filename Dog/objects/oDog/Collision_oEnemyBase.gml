/// @description Insert description here

//Go to BattleScene if the enemy is aggro
if (other.State == estates.Aggro)
{
	scrFadeout(rmBattle, c_maroon, 0.05);
	oAreaStats.EnemyBattle = other.BattleObject;
	oAreaStats.EnemyKey = other.Key;
}

