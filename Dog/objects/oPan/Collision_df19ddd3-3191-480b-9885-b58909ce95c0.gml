/// @description Insert description here
// You can write your code in this editor

if(!Hit)
{
	oEnemyBattleParent.Health -= clamp(abs(phy_speed_y),2,4);
	Hit = true;
}