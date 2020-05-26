
//horizontal collision
	if (place_meeting(x+hsppush,y,oWall))
	{
	
		while (!place_meeting(x+sign(hsppush),y,oWall))
		{
			x = x+sign(hsppush);
		}
	hsppush = 0;
	collision = 1;
	}else if (!place_meeting(x,y+vsppush,oWall))
	{
		collision = 0;
		
	}



	x  = x + hsppush;

	



//vertical collision
	if (place_meeting(x,y+vsppush,oWall))
	{
		while (!place_meeting(x,y+sign(vsppush),oWall))
		{
			y = y+sign(vsppush);  
  		}
		vsppush = 0;
		collision = 1;
	}else if (!place_meeting(x+hsppush,y,oWall))
	{
		collision = 0;
		
	}
	



	
	y = y + vsppush;