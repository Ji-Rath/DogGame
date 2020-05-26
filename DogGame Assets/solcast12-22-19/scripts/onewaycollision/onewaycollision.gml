
//horizontal collision
	if (place_meeting(x+hsp,y,oPlatformOneway))
	{
	
		while (!place_meeting(x+sign(hsp),y,oPlatformOneway))
		{
			x = x+sign(hsp);
		}
	hsp = 0;
	
	}else if (!place_meeting(x,y+vsp,oPlatformOneway))
	{
		
		
	}





	



//vertical collision
	if (place_meeting(x,y+vsp,oPlatformOneway))
	{
		while (!place_meeting(x,y+sign(vsp),oPlatformOneway))
		{
			y = y+sign(vsp);  
  		}
		vsp = 0;
		
	}else if (!place_meeting(x+hsp,y,oPlatformOneway))
	{
		
		
	}
	



	
