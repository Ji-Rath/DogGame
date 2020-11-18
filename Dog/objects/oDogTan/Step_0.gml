/// @description Insert description here
// You can write your code in this editor

if (!bCompleted && mouse_check_button(mb_left) && !collision_point(mouse_x, mouse_y, oSunscreen, false, true))
	oMiniGame.CreateInstance(mouse_x+random_range(-50,50), mouse_y+random_range(-50,50), oSunscreen, "Instances2");