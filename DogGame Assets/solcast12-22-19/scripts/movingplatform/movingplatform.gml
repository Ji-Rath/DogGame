	if (place_meeting(x,y+1,oMovingplatform))
	{
		
		x += oMovingplatform.hsp;
		//y = oMovingplatform.y-45;
		y += oMovingplatform.vsp-3;
/*
		if (place_meeting(x+(move * ledgedetectrange),y,oWall)) and (distancePlayerheight < -100) and (canjump != 0)
		{
		
			canjump -= 1;
		
			vsp = -jumpstrength;
		
		}
		
		*/
	}