/// @description Insert description here
// You can write your code in this editor

//If enemy collides with player, go to battle scene

//Go to battle scene if enemy is alert
if (other.state == estates.aggro && other.visible = true)
{
	scrFadeout(battle, c_maroon, 0.05);
	BattleAttacker = other.BattleObject;
	Attacker = other;
}
	
