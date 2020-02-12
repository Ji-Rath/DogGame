/// @description Insert description here
// You can write your code in this editor

//If enemy collides with player, go to battle scene

//Go to battle scene if enemy is alert
if (other.State == estates.Aggro && other.visible = true)
{
	scrFadeout(rmBattle, c_maroon, 0.05);
	BattleAttacker = other.BattleObject;
	Attacker = other;
}
	
