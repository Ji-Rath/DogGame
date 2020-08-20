function scrEnemyDetect() {
	var PlayerDistance = point_distance(x,y,oDog.x,oDog.y);
	if (PlayerDistance < DetectRange)
	{
	
		if (sprite_index = SWalk)
		{
			var m = oDog.x - x;
		
			if (sign(image_xscale) = sign(m))
			{
				State = estates.Alert;
				timer[0] = 0.5*60;
			
			}
		}
		else if (sprite_index = SWalkUp)
		{
			var m = oDog.y - y;
		
			if (m < 0)
			{
				State = estates.Alert;
				timer[0] = 0.5*60;
			
			}
		}
		else if (sprite_index = SWalkDown)
		{
			var m = oDog.y - y;
		
			if (m > 0)
			{
				State = estates.Alert;
				timer[0] = 0.5*60;
			}
		
		}
	}


}
