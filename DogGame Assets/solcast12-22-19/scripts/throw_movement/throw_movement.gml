if (place_meeting(x+throwhsp,y,oWall))
	{
		yplus = 0;
		while (place_meeting(x+throwhsp,y-yplus,oWall) and yplus <= abs(2*throwhsp))
		{
			
			yplus += 1;
			
		}
		
		
		
		if (place_meeting(x+throwhsp,y-yplus,oWall))
		{
			while (!place_meeting(x+sign(throwhsp),y,oWall))
			{
				x = x+sign(throwhsp);
			}

			throwhsp = 0;
				
				
			
		
			
			
		}
		else
		{
			y -= yplus;
			
		}
		


	
		
	}


	x = x + throwhsp;

	

	
	if (!place_meeting(x,y,oWall)) and (throwvsp >= 0) and (place_meeting(x,y+2+abs(throwhsp),oWall))
	{
		
		while (!place_meeting(x,y+1,oWall))
		{
			y += 1;
			
		}
		
	}
	
	
	
	
	


//vertical collision
	if (place_meeting(x,y+throwvsp,oWall))
	{
		while (!place_meeting(x,y+sign(throwvsp),oWall))
		{
			y = y+sign(throwvsp);  
  		}
		throwvsp = 0;
	}

     

	y  = y + throwvsp;

