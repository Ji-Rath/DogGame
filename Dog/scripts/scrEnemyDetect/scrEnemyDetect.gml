var PlayerDistance = point_distance(x,y,oDogPaddler.x,oDogPaddler.y);
if (PlayerDistance < DetectRange)
{
	
	if (sprite_index = SWalk)
	{
		var m = oDogPaddler.x - x;
		
		if (sign(image_xscale) = sign(m))
		{
			State = estates.Alert;
			timer[0] = 0.5*60;
			
		}
	}
	else if (sprite_index = SWalkUp)
	{
		var m = oDogPaddler.y - y;
		
		if (m < 0)
		{
			State = estates.Alert;
			timer[0] = 0.5*60;
			
		}
	}
	else if (sprite_index = SWalkDown)
	{
		var m = oDogPaddler.y - y;
		
		if (m > 0)
		{
			State = estates.Alert;
			timer[0] = 0.5*60;
		}
		
	}
}