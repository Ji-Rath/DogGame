/// @description Insert description here

//Go to BattleScene if the enemy is aggro
if (other.State == estates.Aggro)
{
	scrFadeout(rmBattle, seqCircleTransition);
	oAreaStats.StoreEnemy(other);
}

