/// @description Insert description here
// You can write your code in this editor

if (place_meeting(x,y,oShinigami))
{
	instance_destroy();	
	instance_create_layer(x,y,"parryspark",oHealshatter);
	
}

if (state == 0)
{

	
	
	
	
}
else if (state == 1)
{
	var seconds = 1;
	
	movecount ++;
	if (movecount > 60*seconds) and (stats.phealth < stats.maxphealth) 
	{
		var distancetoplayer = point_distance(x,y,oPlayer.x,oPlayer.y)
		var range = 110;
		
		if (distancetoplayer< range) and (oPlayer.iframestate = iframes.inactive)
		{
		
			instance_destroy();
			stats.phealth ++;
			instance_create_layer(oPlayer.x,oPlayer.y,"parryspark",oHealfx)
		
		
		}
	}
	
	
	var dist2player = point_distance(x,y,oPlayer.x,oPlayer.y);
	
	
	
	var followdist = 100;
	
	
	var dir2 = point_direction(x,y,oPlayer.x,oPlayer.y)
	var speed2player = 3;

	hsp += lengthdir_x(speed2player,dir2)*moveprime;
	vsp += lengthdir_y(speed2player,dir2)*moveprime;
	
	hsp *= 0.9;
	vsp *= 0.9

		if (dist2player<followdist)
	{
		moveprime = 0;

	}
	else
	{
		moveprime = 1;
		
		
	}

		y += vsp;
		x += hsp;
		
		
		x += hspcollide;

		y += vspcollide;
	/*
	if (abs(dirtoplayerx) > followdist) or (abs(dirtoplayery) > followdist)
	{
	
		y += vsp;
		x += hsp;
	}
	*/
}