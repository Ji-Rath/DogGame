if (place_meeting(x+hsp,y,oWall))
{
	while (!place_meeting(x+sign(hsp),y,oWall))
	{
		x = x+sign(hsp);
		
	}
	hsp = 0;
}


if (place_meeting(x,y+vsp,oWall))
{
	while (!place_meeting(x,y+sign(vsp),oWall))
	{
		y = y+sign(vsp);
		
	}
	vsp = 0;
}


if(visible)
{
	x += hsp;
	y += vsp;
}