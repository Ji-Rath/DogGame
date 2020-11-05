/// @description Insert description here
// You can write your code in this editor

CurrentPosition = floor(image_index);

if (mouse_y > y+100)
	image_index = 2;
else if (mouse_y < y-100)
	image_index = 1;
else
	image_index = 0;

if (image_index != 0 && CurrentPosition != image_index)
	oCampfire.IncreaseWind(1);
