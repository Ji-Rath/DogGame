/// @description Insert description here
// You can write your code in this editor

if(!Hit && Grabbed)
{	
	physics_apply_impulse(x,y,(mouse_x-x)*50,(mouse_y-y)*50);
	phy_position_x = mouse_x;
	phy_position_y = mouse_y;
}