/// @description Insert description here
// You can write your code in this editor

//If interact key pressed, go to next page, or destroy if empty
if (keyboard_check_pressed(KeyInteract))
{
	
	if (Page < array_length_1d(Text)-1)
	{
		Page ++;
		TextPos = 0;
	}
	else
	{
		instance_destroy();
		Speaker.TextCooldown = true;
	}
}