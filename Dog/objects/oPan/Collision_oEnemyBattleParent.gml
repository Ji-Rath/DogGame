/// @description Insert description here
// You can write your code in this editor

//Apply damage to enemy if the pan collides with the enemy
if(!Hit)
{
	oEnemyBattleParent.Health -= clamp(abs(phy_speed_y),2,4);
	Hit = true;
	oMiniGame.timer[1] = 0.5*60;
	
	var Icon = instance_create_layer(room_width/2, room_height/2, "GUI", oIconPopup);
    Icon.Sprite = sCheckMark;
}
