
///@desc a struct that holds two values
function Vector2(XVal, YVal) constructor
{
	X = XVal;
	Y = YVal;
	
	function Magnitude()
	{
		return sqrt(sqr(X)+sqr(Y));
	}
	function Set(Val)
	{
		X = Val;
		Y = Val;
	}
}

/// @desc Prevent the specified object from moving into collision tiles.
/// @arg {struct} Vec2
/// @return The new velocity of the object
function scrMoveCollision(Velocity)
{
	var bbox_side;
	
	// Ensure instance is not on path
	if(path_index == -1)
	{
		if(HTileCollision(Velocity))
		{
			if(Velocity.X > 0)
			{
				bbox_side = bbox_right;
				x = x - (bbox_side % 32) + 31;
			}
			else 
			{
				bbox_side = bbox_left;
				x = x - (bbox_side % 32);
			}
				
			Velocity.X = 0;
		}
		
		if(VTileCollision(Velocity))
		{
			if(Velocity.Y > 0)
			{
				bbox_side = bbox_bottom;
				y = y - (bbox_side % 32) + 31;
			}
			else 
			{
				bbox_side = bbox_top;
				y = y - (bbox_side % 32);
			}
				
			Velocity.Y = 0;
		}
	}
	return new Vector2(Velocity.X, Velocity.Y);
}

/// @desc Check for vertial collision with tile
function VTileCollision(Velocity)
{
	var tilemap = layer_tilemap_get_id("Collision");
	var bbox_side;
	
	//Tilemap Y Collision
	if(Velocity.Y > 0)
		bbox_side = bbox_bottom;
	else 
		bbox_side = bbox_top;
		
	if(tilemap_get_at_pixel(tilemap,bbox_left,bbox_side+Velocity.Y) != 0) || (tilemap_get_at_pixel(tilemap,bbox_right,bbox_side+Velocity.Y) != 0)
		return true;
	
	return false;
}

/// @desc Check for horizonal collision with tile
function HTileCollision(Velocity)
{
	var tilemap = layer_tilemap_get_id("Collision");
	var bbox_side;
	
	//Tilemap X Collision
	if(Velocity.X > 0)
		bbox_side = bbox_right;
	else 
		bbox_side = bbox_left;
	if(tilemap_get_at_pixel(tilemap,bbox_side+Velocity.X,bbox_top) != 0) || (tilemap_get_at_pixel(tilemap,bbox_side+Velocity.X,bbox_bottom) != 0)
		return true;
	
	return false;
}
