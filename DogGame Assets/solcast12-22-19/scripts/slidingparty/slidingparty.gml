

	if (!place_meeting(x,y+3,oSlope))
	{
		macrostate1 = party1macrostates.followplayer;
		
	}
	
	if (place_meeting(x,y+30,oSlope))
	{
		
	
	}
	
	if (place_meeting(x+3,y,oSlope))
	{
		slopedir = -1;
		
		
		
		
	}
	else
	{
		slopedir = 1;
		
	}
	
	vsp += grv;
	if (slopedir == 1)
	{
			hsp += 1.5*oPlayer.walksp
		
	}
	else if (slopedir == -1)
	{
		
			hsp -= 1.5*oPlayer.walksp
			
	}
	


	
	image_xscale = sign(hsp)*scale;
	
	
	

	movement_collision()
	
	
	
	if (place_meeting(x,y,mSlopereset))
	{

		
		
		
		macrostate1 = party1macrostates.followplayer;
		
		

		
		
		
		
	}
