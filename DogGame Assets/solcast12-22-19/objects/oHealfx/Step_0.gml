/// @description Insert description here
// You can write your code in this editor
x = oPlayer.x;
y = oPlayer.y;
count ++;

if (count < 2)
{
	sprite_index = sHealfx;
	image_index = 0;
	
	
}
else if (count < 2*image_number)
{
	sprite_index = sHealfx;
	
	
}
else
{
	
	instance_destroy();
	
}