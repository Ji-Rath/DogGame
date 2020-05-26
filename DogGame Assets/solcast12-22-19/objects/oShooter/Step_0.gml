/// @description Insert description here
// You can write your code in this editor
var disttoplayer = point_distance(x,y,oPlayer.x,oPlayer.y)

if (disttoplayer < range) and (oPlayer.y < y+250) and (sign(image_xscale) == sign(oPlayer.x-x)) and (abs(oPlayer.x-x) > range2) and (oPlayer.y >y-750)
{
	count ++;
	if (count == 2)
	{
		
		instance_create_layer(x,y,"parryspark",oShinigami);
		
		
	}
	
	
	if (count > 200)
	{
		count = 0;
		
	}
	
}
else
{
	count = 0;
	
}