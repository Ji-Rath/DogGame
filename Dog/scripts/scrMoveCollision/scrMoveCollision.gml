///@desc Prevent the specified object from moving into collision tiles. Then give the object speed otherwise.


var tilemap = layer_tilemap_get_id("Collision");
var bbox_side;

if(path_index == -1)
{
	//Tilemap X Collision
	if(HSpeed > 0)
		bbox_side = bbox_right;
	else 
		bbox_side = bbox_left;
	if(tilemap_get_at_pixel(tilemap,bbox_side+HSpeed,bbox_top) != 0) || (tilemap_get_at_pixel(tilemap,bbox_side+HSpeed,bbox_bottom) != 0)
	{
		if(HSpeed > 0)
			x = x - (bbox_side % 32) + 31;
		else 
			x = x - (bbox_side % 32);
		HSpeed = 0;
	}
	
	
	//Tilemap Y Collision
	if(VSpeed > 0)
		bbox_side = bbox_bottom;
	else 
		bbox_side = bbox_top;
		
	if(tilemap_get_at_pixel(tilemap,bbox_left,bbox_side+VSpeed) != 0) || (tilemap_get_at_pixel(tilemap,bbox_right,bbox_side+VSpeed) != 0)
	{
		if(VSpeed > 0)
			y = y - (bbox_side % 32) + 31;
		else 
			y = y - (bbox_side % 32);
		VSpeed = 0;
	}
	
	
	x += HSpeed;
	y += VSpeed;
}