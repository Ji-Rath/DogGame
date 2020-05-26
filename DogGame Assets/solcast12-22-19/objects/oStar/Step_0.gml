/// @description Insert description here
// You can write your code in this editor



if (state == 0)
{
	var playerdist = point_distance(x,y,oPlayer.x,oPlayer.y);
	var irange = 200;
	if (playerdist < irange)
	{
		state = 1;
		angle = random(360);
		
	}
	angle += 0.1 ;
	var movelength = 2;
	var circley = movelength*sin(angle);
	y += circley;
	
	
}
else if (state == 1)
{
	

	
		if (place_meeting(x,y,oShinigami))
	{
		instance_destroy();	
		instance_create_layer(x,y,"parryspark",oHealshatter);
		with (oShinigami)
		{
			var shinidist = point_distance(x,y,other.x,other.y);
			if (shinidist < 100)
			{
				instance_destroy();
				instance_destroy(myparticle);
				instance_create_layer(x,y,"parryspark",oShinismoke);
				var spark = instance_create_layer(x,y,"parryspark",oParryspark);
			
			
			}
		
		}
	

	
	}


	with (oMob)
	{
		var mobdist = point_distance(x,y,other.x,other.y);
		if (place_meeting(x,y,other))
		{
		
			//state = mobstates.freeze;
			//freezecount = 0;
			//parried = 1;
			//instance_create_layer(x,y,"parryspark",oParryspark);
			if (mobstate = mobstates.freeze)
			{
				instance_destroy(other);
				/*
				with (oPlayer)
				{
					if (!place_meeting(x,y+3,oWall))
					{
						vsp = -1.2*jumpstrength;
					
					}
				
				}*/
			}
		}
		
		
		
	}

	
	movecount ++;
	angle += 0.1;
	var movelength = 200;
	var circlex = movelength*cos(angle);
	var circley = movelength*sin(angle);
	
	
	var rotatex = follow.x + circlex;
	var rotatey = follow.y + circley;
	
	
	
	
	y += (rotatey - y)/7
	x += (rotatex - x)/7
	
	x += hspcollide;
	y += vspcollide;
	
	
	
	/*
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
		
		
	}*/

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