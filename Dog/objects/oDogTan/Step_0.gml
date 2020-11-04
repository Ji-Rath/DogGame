/// @description Insert description here
// You can write your code in this editor

if (mouse_check_button(mb_left) && !collision_point(mouse_x, mouse_y, oSunscreen, false, true))
	instance_create_layer(mouse_x+random_range(-50,50), mouse_y+random_range(-50,50), "Instances2", oSunscreen);