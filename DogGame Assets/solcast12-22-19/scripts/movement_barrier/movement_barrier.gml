if (place_meeting(x+hsp,y,mobbarrier))
	{
		yplus = 0;
		while (place_meeting(x+hsp,y-yplus,mobbarrier) and yplus <= abs(2*hsp))
		{
			
			yplus += 1;
			
		}
		
		
		
		if (place_meeting(x+hsp,y-yplus,mobbarrier))
		{
			while (!place_meeting(x+sign(hsp),y,mobbarrier))
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


	x = x + hsp;

	

	
	if (!place_meeting(x,y,mobbarrier)) and (vsp >= 0) and (place_meeting(x,y+2+abs(hsp),mobbarrier))
	{
		
		while (!place_meeting(x,y+1,mobbarrier))
		{
			y += 1;
			
		}
		
	}
	
	
	
	
	


//vertical collision
	if (place_meeting(x,y+vsp,mobbarrier))
	{
		while (!place_meeting(x,y+sign(vsp),mobbarrier))
		{
			y = y+sign(vsp);  
  		}
		vsp = 0;
	}

     

	y  = y + vsp;

