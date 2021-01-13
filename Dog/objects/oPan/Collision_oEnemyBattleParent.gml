/// @description Insert description here
// You can write your code in this editor

//Apply damage to enemy if the pan collides with the enemy
if(!Hit && oBattleManager.GetFocusedEnemy() == other.id)
{
	oBattleManager.GetFocusedEnemy().Health -= clamp(abs(phy_speed_y),1.5,2.5);
	Hit = true;
	
	with(oCamera)
		ScreenShake(20, 15);
	
	scrFinishMiniGame(true);
	
	if(Joint != -1)
		physics_joint_delete(Joint);
}
