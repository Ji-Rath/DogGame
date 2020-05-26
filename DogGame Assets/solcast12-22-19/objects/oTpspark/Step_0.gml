count += 1;

x = oPlayer.x;
y = oPlayer.y;
if (count < 2)
{
	sprite_index = sTpeffect;
	image_index = 0;
	
}
else if (count < 4*5)
{
	sprite_index = sTpeffect;
	
	
}
else
{
	
	instance_destroy();
	
}