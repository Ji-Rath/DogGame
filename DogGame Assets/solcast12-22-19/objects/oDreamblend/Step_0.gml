/// @description Insert description here
// You can write your code in this editor
x = VCam.x;
y = VCam.y
if (state = dreamstates.on)
{
	if (image_alpha < 0.5)
	{
		image_alpha += alphainc;
		
	}
	
	if (dreamsnow = noone)
	{
		dreamsnow = instance_create_layer(x,y,"parryspark",heartsnow)
		
	}
	
	
}
else if (state = dreamstates.off)
{
	if (image_alpha > 0)
	{
		image_alpha -= alphainc;
	
	}
	if (dreamsnow != noone)
	{
		instance_destroy(dreamsnow)
		dreamsnow = noone;
	}
}