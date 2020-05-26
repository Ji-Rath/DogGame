/// @description Insert description here
// You can write your code in this editor



var seconds = 60;
var inc = seconds*2;

if (state = 1)
{
	count += 1;
	
	
	image_alpha += 0.5/inc;
	if (count >= inc)
	{
		
		state = 2;
		
		
	}
	
}
else if (state = 2)
{
	image_alpha -= 0.5/inc;
	count -= 1;
	
	if (count <= 0)
	{
		image_alpha = 0.5;
		state = 1;
		count = 0;
		
	}
	
}


