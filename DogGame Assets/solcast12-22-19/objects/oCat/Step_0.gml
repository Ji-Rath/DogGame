/// @description Insert description here
// You can write your code in this editor
if (state != catstates.parried)
{
	onewaystarting();
	movement_collision();
}

var rangetoplayer = point_distance(x,y,oPlayer.x,oPlayer.y);

var playerdirection = sign(oPlayer.x - x);
if (myhitbox == noone)
{
	myhitbox = instance_create_layer(x,y,"hitboxes",oHitbox)
	myhitbox.creator = self;
	myhitbox.creatorknockback = catstates.knockback;
	myhitbox.creatorparried = catstates.parried;
	myhitbox.creatorstrength = mystrength;
	myhitbox.sprite_index = spriterun;
	myhitbox.null = catstates.belly;
}



with (oWall)
{
	if(place_meeting(x,y-3,other))
	{
		other.image_angle = image_angle;
		
		
	}
	
	
}


if (state != catstates.belly) or (myhitbox.parried != 1)
{
	
	myhitbox.state = hitboxstates.active;
	
}

#region countreset
if (state != catstates.alert)
{
	wakecount = 0;
	
	
}


if (state != catstates.sprint)
{
	startupcount = 0;
	
	
}


if (state != catstates.sprintstop)
{
	towakecount = 0;
	
	
}

if (state != catstates.returntosleep)
{
	tosleepcount = 0;
	
	
}

if (state != catstates.parried)
{
	parriedcount = 0;
	
}

if (state != catstates.belly)
{
	bellycount = 0;
	
}

if (state != catstates.knockback)
{
	knockbackcount = 0;
	
}



#endregion





#region behavior state machine

if (state == catstates.sleep)
{
	#region sleep
	
	vsp += grv;
	hsp *= movefriction;
	
	if (rangetoplayer < detectrange)
	{
		state = catstates.alert;
		
	}
	
	
	sprite_index = spritesleep;
	
	
	
	#endregion
	
}
else if (state == catstates.alert)
{
	#region alert
	
	
	vsp += grv;
	hsp *= movefriction;
	
	
	if (rangetoplayer > detectrange) and (wakecount > 50)
	{
		state = catstates.returntosleep;
		
	}
	
	if (rangetoplayer < aggrorange)
	{
		state = catstates.sprint;
		
	}
	
	wakecount += 1;
	
	if (wakecount < 2)
	{
		sprite_index = spritewakestart;
		image_index = 0;
	}
	else if (wakecount < wakeframes)
	{
		sprite_index = spritewakestart;
		
	}
	else
	{
		sprite_index = spritewake;
		
	}
	
	
	
	
	#endregion
	
}
else if (state == catstates.sprint)
{
	if (rangetoplayer > aggrorange)
	{
		state = catstates.sprintstop;
		
	}
	
	if (myhitbox.hit = 1)
	{
		
		state = catstates.sprintstop;
		
	}
	
	
	
	vsp += grv;
	hsp *= movefriction;
	
	if (hsp != 0)
	{
		image_xscale = sign(hsp)*scale;
		
	}
	
	hsp += move*walksp;
	move = playerdirection;
	
	
	
	
	startupcount += 1;
	
	if (startupcount < 2)
	{
		sprite_index = spritestartup;
		image_index = 0;
		
	}
	else if (startupcount < startupframes)
	{
		sprite_index = spritestartup;
		
	}
	else
	{
		sprite_index = spriterun;
		
		
	}
	
	
	
	
	
	
	
}
else if (state == catstates.sprintstop)
{

	
	
	
	vsp += grv;
	hsp *= movefriction;
	hsp += move*walksp;
	move = 0;
	
	towakecount += 1;
	
	if (towakecount < 2)
	{
		sprite_index = spritetowake;
		image_index = 0;
		
		
	}
	else if (towakecount < towakeframes)
	{
		sprite_index = spritetowake;
		
	}
	else
	{
		sprite_index = spritewake;
		
		
	}
	
	
	if (towakecount > 20) and (rangetoplayer > detectrange)
	{
		state = catstates.returntosleep;
		
		
	}
	
	if (towakecount > 20) and (rangetoplayer < aggrorange)
	{
		state = catstates.sprint;
		
		
	}
	
	
	
	
	
	
	
	
}
else if (state == catstates.returntosleep)
{
	
	vsp += grv;
	hsp *= movefriction;
	hsp += move*walksp;
	move = 0;
	
	
	tosleepcount += 1;
	
	if (tosleepcount < 2)
	{
		sprite_index = spritetosleep;
		image_index = 0;
		
	}
	else if (tosleepcount < tosleepframes)
	{
		
		sprite_index = spritetosleep;
	}
	else
	{
		state = catstates.sleep;
		
	}
	
	
	
	
	
	
	
	
	
	
}
else if  (state == catstates.parried)
{
	
	
	x=x;
	y=y;
	parriedcount += 1;
	
	if (parriedcount > 3)
	{
		state = catstates.knockback;
		
		
	}
	
}
else if (state == catstates.knockback)
{
	if (!place_meeting(x,y+3,oWall))
	{
		image_angle = 0;
		
	}
	
	if (knockbackcount > 4) and (place_meeting(x,y+3,oWall))
	{
		state = catstates.sleep;
		
		
	}
	
	
	
	vsp += grv;
	hsp *= movefriction;
	hsp += move*walksp;
	move = 0;
	
	knockbackcount += 1;
	
	if (knockbackcount < 2)
	{
		hsp = -sign(image_xscale)*knockbackstrength;
		vsp = -knockupstrength;
		
		
	}
	
	
}
else if (state == catstates.belly)
{
	
	
	bellycount += 1;
	
	if (bellycount > 100)
	{
		state = catstates.sleep;
		
	}
	
	myhitbox.state = hitboxstates.inactive
	
	if (place_meeting(myhitbox.x,myhitbox.y+3,oPlayer))
	{
		oPlayer.vsp = -100;
		
	}
	
	
}

#endregion