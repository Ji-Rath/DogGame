/// @description Insert description here
// You can write your code in this editor


#region 




if (mybouncebox = noone)
{
	mybouncebox = instance_create_layer(x,y,"parryspark",oGroundbounce);
	mybouncebox.myparent = id;
	
	
}
if (instance_exists(oPlayer))
{	
	var playerdir = (sign(oPlayer.x - x))
	var playerdist = abs(oPlayer.x-x)
	
	
	
}
if (place_meeting(x,y+3,oWall))
{
	/*
	var instwall = collision_line(x-25,bbox_bottom,x-25,y+100,true,oWall,true)
	var instwall2 = collision_line(x+25,bbox_bottom,x+25,y+100,true,oWall,true)
	*/
	var instwall = instance_place(x,y+3,oWall)
	var instwall2 = instance_place(x-(sign(image_xscale)*10),y+3,oWall)
	
	if (instwall != noone) and (instwall = instwall2)
	{
		image_angle = instwall.image_angle;
		
		
	}
	/*
	with (oWall)
	{
		other.image_angle = image_angle
		
		
	}
	*/
	
}
else
{
	image_angle = 0;
	
}


if  (myspawn = noone)
{
	
	myspawn = instance_create_layer(x,y,"marker",oBranch2);
	
	
}




if (state != mobgroundstates.wake) wakecount = 0;
if (state != mobgroundstates.returntospawn) returnbuffer = 0;
if (state != mobgroundstates.idle) idlecount = 0;
if (state != mobgroundstates.wander) wandercount = 0; 
if (state != mobgroundstates.aggro) aggrocount = 0;
if (state != mobgroundstates.attack) attackcount = 0;
if (state != mobgroundstates.recover) recovercount = 0;
if (state != mobgroundstates.parried) parriedcount = 0; 
if (state != mobgroundstates.knockback) knockbackcount = 0;
if (state != mobgroundstates.bounce)
{
	bounce = false;
	bouncecount = 0;
	
}



	if (place_meeting(x+hsp,y+vsp,oParry)) and (oParry.state = parrystates.active) and (state != mobgroundstates.bounce)
	{
		
		state = mobgroundstates.parried;
		
	}
	
	if (state != mobgroundstates.bounce) and (state != mobgroundstates.bounce2)
	{
		if (oPlayer.state = states.Playeremptynormal)
		{
		
			if (place_meeting(x,y,oPlayer)) and (oParry.state = parrystates.inactive) and (oPlayer.iframestate == iframes.inactive)
			{
				vsp = -10;
				state = mobgroundstates.returntospawn;
				strength = 1;
				mob_collide2();
				
			}
		
		}
		if (oPlayer.state = states.Playernormal)
		{
			if (place_meeting(x,y,oPlayer)) and (oParry.state = parrystates.inactive) and (oPlayer.iframestate == iframes.inactive)
			{
				vsp = -10;
				state = mobgroundstates.returntospawn;
				strength = 1;
				mob_collide();
			}
		
		
		}
	}



#endregion




if (state == mobgroundstates.idle)
{
	sprite_index = idlesprite;
	#region
	
	bouncecount = 0;
	var spawndist = (point_distance(x,y,myspawn.x,myspawn.y));
	if (spawndist > spawnrange)
	{
		state = mobgroundstates.returntospawn;
		
		
	}
	movement_collision();
	vsp += grv;
	
	hsp+=move*walksp;
	hsp *= movefriction;
	move = 0;
	idlecount += 1
	
	if (idlecount >= 60*time)
	{
		
		state = mobgroundstates.wander;
		dir = irandom_range(0,1);
		if (dir = 0)
		{
			
			move = -1;
			
			
		}
		else
		{
			move = 1;
			
		}
		
		
		
		
	}
	playerheightdist = oPlayer.y-y;
	
	
	if (sign(image_xscale)== playerdir) and (playerdist < aggrorange) and (playerheightdist < heightrange)
	{
		
		state = mobgroundstates.aggro;
		
		
	}
	
	#endregion
	
}
else if (state == mobgroundstates.wander)
{
	sprite_index = walksprite
	#region
	var spawndist = (point_distance(x,y,myspawn.x,myspawn.y));
	if (spawndist > spawnrange)
	{
		state = mobgroundstates.returntospawn;
		
		
	}
	
	
	
	
	
	if (hsp != 0)
{
	image_xscale = scale*sign(hsp);
}
	movement_collision();
	vsp += grv;
	hsp+=move*(walksp/4);
	hsp *= movefriction;
	
	
	wandercount += 1;
	
	if (place_meeting(x+hsp,y,oWall))
	{
		move = -move;
		
	}
	
	
	if (wandercount >= room_speed*time)
	{
		
		state = mobgroundstates.idle;
		

		
	}
		
	if (sign(image_xscale)== playerdir) and (playerdist < aggrorange) 
	{
		
		state = mobgroundstates.aggro;
		
		
	}
	
		
	#endregion
	
}
else if (state == mobgroundstates.aggro)
{
	sprite_index = runsprite
	
	#region
	
	if (hsp != 0)
{
	image_xscale = scale*sign(hsp);
}
	movement_collision();
	vsp += grv;
	hsp+=move*walksp;
	hsp *= movefriction;
	
	
	move = playerdir;
	
	
	if (playerdist > aggrorange)
	{
		
		state = mobgroundstates.returntospawn;
		
		
		
	}
	/*else if (playerdist < attackrange) and (place_meeting(x,y+3,oWall))
	{
		
		state = mobgroundstates.attack;
		
		vsp = - 30;
	}
	*/
	#endregion
	
}
else if (state == mobgroundstates.attack)
{
	
	
	#region
	if (hsp != 0)
{
	image_xscale = scale*sign(hsp);
}
	movement_collision();
	vsp += grv;
	hsp+=move*walksp;
	hsp *= movefriction;
	
	
	move = playerdir;
	attackcount += 1;
	
	
	

	if (place_meeting(x,y+3,oWall))
	{
		state = mobgroundstates.aggro;
		
	}
	

	
	
		



	#endregion
	if (attackcount < 2)
	{
		sprite_index = jumpsprite
		image_index = 0;
	}
	else if (attackcount < 2*image_number)
	{
		
		sprite_index = jumpsprite
		
	}
	else
	{
		sprite_index = fallsprite
		
	}
	
	
	
}
else if (state == mobgroundstates.recover)
{
	if (place_meeting(x,y+3,oWall))
	{
		sprite_index = walksprite
		
	}
	else if (recovercount < 2)
	{
		sprite_index = jumpsprite
		image_index = 0;
		
	}
	else if (recovercount < image_number *2)
	{
		sprite_index = jumpsprite
		
		
	}
	else
	{
		sprite_index = fallsprite
		
		
	}
	#region
	movement_collision();
	vsp += grv;
	hsp+=move*walksp;
	hsp *= movefriction;
	
	
	move = playerdir;
	recovercount += 1;
	
	if (recovercount > room_speed * time)
	{
		state = mobgroundstates.idle;
		
		
		
	}
	#endregion
	
}
else if (state == mobgroundstates.parried)
{
	
	sprite_index = impactsprite
	
	#region
	oPlayer.state = states.Playerparry;
	parriedcount += 1;
	if (parriedcount> 6)
	{
		state = mobgroundstates.knockback2;
		
		
		vsp = -20;
		hsp = -playerdir*30;
		
	}
	
	if (myparryspark == noone)
	{
		var sparkposx = (oPlayer.x+x)/2;
		var sparkposy = (oPlayer.y+y)/2;
		myparryspark = instance_create_layer(sparkposx,sparkposy,"parryspark",oParryspark);
		
	}
	
	
	#endregion
}
else if (state == mobgroundstates.knockback)
{
	sprite_index = knockbacksprite
	
	
	#region
	parriedcount = 0;
	movement_collision();
	vsp += grv;
	
	hsp *= movefriction;
	
	myparryspark = noone;
	
	image_xscale = playerdir*scale;
	
	if (place_meeting(x,y+3,oWall))
	{
		state = mobgroundstates.idle;
		
		
	}
	
	#endregion
}
else if (state == mobgroundstates.knockback2)
{
	sprite_index = knockbacksprite
	#region
	parriedcount = 0;
	movement_collision();
	vsp += grv;
	
	hsp *= movefriction;
	
	myparryspark = noone;
	
	image_xscale = playerdir*scale;
	
	if (place_meeting(x,y+3,oWall))
	{
		state = mobgroundstates.bounce;
		
		
	}
	#endregion
	
}
else if (state == mobgroundstates.returntospawn)
{
returnbuffer += 0;

	if (sign(image_xscale)== playerdir) and (playerdist < aggrorange) and (playerheightdist < heightrange)
	{
		
		state = mobgroundstates.aggro;
		
		
	}


#region
	
	if (place_meeting(x+(sign(hsp)*10),y-10,oWall))
	{
		returnclimbcount += 1
		if (returnclimbcount < 2)
		{
			sprite_index = climbstartsprite
			image_index = 0;
		}
		else if (returnclimbcount < 2*climbstartframes)
		{
			sprite_index = climbstartsprite
			
			
		}
		else
		{
			vsp = -10;
			
			sprite_index = climbsprite
			
		}
		
		
	}
	else if (place_meeting(x,y+3,oWall))
	{
		returnjumpcount = 0;
		sprite_index = walksprite;
		returnclimbcount = 0;
		
		
		
	}
	else
	{
		returnjumpcount += 1;
		if (returnjumpcount < 2)
		{
			sprite_index = jumpsprite;
			image_index = 0;
			
			
		}
		else if (returnjumpcount < 2*jumpframes)
		{
			sprite_index = jumpsprite;
			
			
		}
		else
		{
			
			sprite_index = fallsprite;
			
		}
		
	}
#endregion
	
	#region
	if (hsp != 0)
	{
		image_xscale = scale*sign(hsp);
		
	}
	movement_collision();
	vsp += grv;
	
	hsp *= movefriction;
	
	var spawndist = (point_distance(x,y,myspawn.x,myspawn.y));
	if (spawndist < spawnrange)
	{
		state = mobgroundstates.idle;
		
		
	}
	
	
	
	var spawndir = sign(myspawn.x - x);
	move = spawndir;
	hsp += move*(walksp/4);
	
	

	
	
	#endregion
}
else if (state == mobgroundstates.bounce)
{
	
	
	
	#region
	
	
	
	var bounceseconds  = 2;
	if (bouncecount > bounceseconds * 60 )
	{
		state = mobgroundstates.wake;
		
		
	}
	
	with (oPlayer)
	{
		
		if (place_meeting(x,y-20,other.mybouncebox))
		{
			vsp = -20;
			oPlayer.njumpcount = 0;
			other.bounce = true;
			other.bouncecount = 0;
			
			
		}
		else 
		{
			
			
		}
		
		
	}
	
	#endregion
	
	
	
	
	bouncecount += 1;

		
	
	if (bounce = false)
	{
		if (bouncecount < 2)
		{
		
			sprite_index = flopsprite
			image_index = 0
		
		}
		else if (bouncecount < 2*flopframes)
		{
			sprite_index = flopsprite;
		
		}
		else
		{
			sprite_index = bellyholdsprite;
		
		
		}
	
	}
	else if (bounce = true)
	{
		
		if (bouncecount < 2)
		{
			sprite_index = bellysprite;
			image_index = 0;
			
		}
		else if (bouncecount < 2*bellyframes)
		{
			sprite_index = bellysprite;
			
		}
		else 
		{
			bounce = false;
			
		}
		

	}

	
	
	
}
else if (state = mobgroundstates.wake)
{
	wakecount ++;
	
	if (wakecount < 2)
	{
		
		sprite_index = wakesprite;
		image_index = 0;
		
		
		
	}
	else if (wakecount < 2*image_number)
	{
		sprite_index = wakesprite
		
		
	}
	else
	{
		state = mobgroundstates.idle;
		image_xscale *= -1;
		
	}
	
	
	
	
	
}
