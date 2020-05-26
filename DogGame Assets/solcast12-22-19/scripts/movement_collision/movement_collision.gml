if (place_meeting(x+hsp,y,oWall))
	{
		yplus = 0;
		while (place_meeting(x+hsp,y-yplus,oWall) and yplus <= abs(2*hsp))
		{
			
			yplus += 1;
			
		}
		
		
		
		if (place_meeting(x+hsp,y-yplus,oWall))
		{
			while (!place_meeting(x+sign(hsp),y,oWall))
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

	

	
	if (!place_meeting(x,y,oWall)) and (vsp >= 0) and (place_meeting(x,y+2+abs(hsp),oWall))
	{
		
		while (!place_meeting(x,y+1,oWall))
		{
			y += 1;
			
		}
		
	}
	
	
	

	
	
	


//vertical collision
	if (place_meeting(x,y+vsp,oWall))
	{
		while (!place_meeting(x,y+sign(vsp),oWall))
		{
			y = y+sign(vsp);  
  		}
		vsp = 0;
	}

     

	y  = y + vsp;



