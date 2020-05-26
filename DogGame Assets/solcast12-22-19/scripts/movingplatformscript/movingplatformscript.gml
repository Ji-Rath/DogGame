
if (instance_exists(oMovingplatform))
{
	if (place_meeting(x,y+3,oMovingplatform))
	{
		with(oMovingplatform)
		{
			if (place_meeting(x,y-3,other))
			{
				other.y += vsp;
				
			}
		
		}
	}
	
}