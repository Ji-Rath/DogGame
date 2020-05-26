
	if (place_meeting(x+hsp,y,oPlatformOneway))
	{
		yplus = 0;
		while (place_meeting(x+hsp,y-yplus,oPlatformOneway) and yplus <= abs(1*hsp))
		{
			
			yplus += 1;
			
		}
		
		
		
		if (place_meeting(x+hsp,y-yplus,oPlatformOneway))
		{
			while (!place_meeting(x+sign(hsp),y,oPlatformOneway))
			{
				x = x+sign(hsp);
			}

			hsp = 0;
				
				
			
		
			
			
		}
		else
		{
			y -= yplus;
			
		}
		


	
		
	}


	x  = x + hsp;

	

	
	if (!place_meeting(x,y,oPlatformOneway)) and (vsp >= 0) and (place_meeting(x,y+2+abs(hsp),oPlatformOneway))
	{
		
		while (!place_meeting(x,y+1,oPlatformOneway))
		{
			y += 1;
			
		}
		
	}
	
	
	
	
	


//vertical collision


if (vsp >= 0)
{
	if (place_meeting(x,y+vsp,oPlatformOneway))
	{
		while (!place_meeting(x,y+sign(vsp),oPlatformOneway))
		{
			y = y+sign(vsp);  
  		}
		vsp = 0;
	}

}

	y  = y + vsp;
