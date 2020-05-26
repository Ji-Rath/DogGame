/// @description Insert description here
// You can write your code in this editor
sprite_index = nddog;
if (state == prejadestates.scene1)
{
	if (hsp != 0)
	{
		image_xscale = sign(hsp)*scale;
		
	}
	movement_collision();
	vsp += grv;
	hsp += move*walksp;
	hsp *= movefriction;
	var playerdist = oPlayer.x - x;
	var playerdir = sign(playerdist)
	var distplayer = point_distance(x,y,oPlayer.x,oPlayer.y)
	
	if (distplayer>600)
	{
		
		
		move = playerdir;
	}
	else
	{
		if (text = noone)
		{
			
			count ++
			if (count = 60)
			{
				text = instance_create_layer(x,y,"mob",oMonologue4)
			}
			
		}
		
		move = 0
		
	}
	
	
	if (place_meeting(x,y+3,oWall))
	{
		if (move != 0)
		{
			animstate = prejanimstates.walk;
			
		}
		else if (move = 0)
		{
			animstate = prejanimstates.winddown;
			
		}
		
		
	}
	
	
	

	
	
}















/*
if (animstate = prejanimstates.walk)
{
	walkcount ++;
	
	if (walkcount < 2)
	{
		sprite_index = startupsprite;
		image_index = 0;
		
	}
	else if (walkcount < (12 * 2)-1 )
	{
		sprite_index = startupsprite;
		
	}
	else
	{
		sprite_index = walksprite;
		
	}
	
	
}
else if (animstate = prejanimstates.winddown)
{
	
	winddowncount ++;
	if (winddowncount < 2)
	{
		sprite_index = winddownsprite;
		image_index = 0;
		
	}
	else if (winddowncount < (12 * 2)-1 )
	{
		sprite_index = winddownsprite;
		
		
	}
	else
	{
		
		sprite_index = idlesprite;
		
	}
	
	
	
	
	
}
else if (animstate = prejanimstates.idle)
{
	sprite_index = idlesprite
	
}

if (animstate != prejanimstates.walk)  walkcount = 0;
if (animstate != prejanimstates.winddown)  winddowncount = 0;




