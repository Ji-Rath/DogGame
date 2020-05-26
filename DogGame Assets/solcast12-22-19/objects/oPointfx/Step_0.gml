/// @description Insert description here
// You can write your code in this editor



		

	
	
x = oPlayer.x;
y = oPlayer.y;
count ++;

if (count < 2)
{
	sprite_index = sPointfx;
	image_index = 0;
	
	
}
else if (count < 2*image_number)
{
	sprite_index = sPointfx;
	
	
}
else
{
	
	instance_destroy();
	
}