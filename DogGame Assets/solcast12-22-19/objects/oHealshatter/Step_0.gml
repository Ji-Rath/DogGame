/// @description Insert description here
// You can write your code in this editor
count += 1;

if (count < 2)
{
	sprite_index = sHealshatter;
	image_index = 0;
	
}
else if (count < 2*image_number)
{
	
	sprite_index = sHealshatter;
	
}
else
{
	instance_destroy();
	
}
