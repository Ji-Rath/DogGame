/// @description Insert description here
// You can write your code in this editor
if (player.atmospherecollision = true)
{
	if (atmosphere = noone)
	{
		atmosphere = instance_create_layer(VCam.x,VCam.y,"shadows",oDreamblend)
		
	}
	
	if (instance_exists(atmosphere))
	{
		atmosphere.state = dreamstates.on;
		
	}
	
	
}
else
{

	if (instance_exists(atmosphere))
	{
		atmosphere.state = dreamstates.off;
		
	}
	
	
}