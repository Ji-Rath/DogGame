/// @description Insert description here
// You can write your code in this editor
count ++;


if (count<2)
{
	sprite_index = sheartshatter;
	image_index = 0;
	
	
}
else if (count<((2*image_number)-2))
{
	
	sprite_index = sheartshatter;
	
}
else
{
	instance_destroy();
	oPlayer.heartshatter = noone;
	
	
}