/// @description Insert description here
// You can write your code in this editor
enemyvariablereset();


if (instance_exists(Paddler.battlewarp))
{
	exit;
}

if (state = estates.aggro)
{
	walksp = 4;
}
else
{
	walksp = 2;
	
}

if (state = estates.idle)
{
	Enemy_detect_normal();
	
	hsp = 0;
	vsp = 0;
	movement_collision();
	idlecount += 1;
	var secs = 3;
	
	if (idlecount > secs*60)
	{
		state = estates.wander;
		wanderdirx = choose(-1,1)
		wanderdiry = choose (-1,0,1)
	}
	
	var playerdist = point_distance(x,y,oDogPaddler.x,oDogPaddler.y);
	
	if (playerdist < detectrange) and (oDogPaddler.key_baction) and ((oDogPaddler.hmove != 0) or (oDogPaddler.vmove != 0))
	{
		
		state = estates.alert
		
		
	}
	
	
	
}
else if (state = estates.wander)
{
	Enemy_Walk();
	Enemy_detect_normal();
	
	hsp = wanderdirx*walksp;
	vsp = wanderdiry*walksp;
	movement_collision();	
	wandercount += 1;
	var secs = 1;
	if (wandercount > secs*60)
	{
		state = estates.idle;
		sprite_index = choose(spritedown,spriteup,hsprite);
		
	}
	
	
	
	var playerdist = point_distance(x,y,oDogPaddler.x,oDogPaddler.y);
	
	if (playerdist < detectrange) and (oDogPaddler.key_baction) and ((oDogPaddler.hmove != 0) or (oDogPaddler.vmove != 0))
	{
		
		state = estates.alert

		
	}
	
}
else if (state = estates.alert)
{
	sprite_index = spritealert;
	
	movement_collision();	
	var secs = 0.2;
	if (myalertsign = noone)
	{
		myalertsign = instance_create_layer(x,y-100,"effects",alertsign);
		myalertsign.myuser = id;
	}
	alertcount += 1;
	
	if (alertcount > secs*60)
	{
		state = estates.aggro;
		instance_destroy(myalertsign);
		myalertsign = noone;
		
	}
	var playerdist = point_distance(x,y,oDogPaddler.x,oDogPaddler.y);
	
	if (playerdist > detectrange)
	{
		
		state = estates.idle;
		instance_destroy(myalertsign);
		myalertsign = noone;
		sprite_index = choose(spritedown,spriteup,hsprite);
	}
	
}
else if (state = estates.aggro)
{
	Enemy_Run();
	movement_collision();	
	
	var playerdirx = sign(oDogPaddler.x-x);
	var playerdiry = sign(oDogPaddler.y-y);

	
	var playerdist = point_distance(x,y,oDogPaddler.x,oDogPaddler.y);
	if (playerdist > detectrange)
	{
		
		state = estates.idle;
		sprite_index = choose(spritedown,spriteup,hsprite);
		
	}
	
	var distbuffer = 50;
	
	var playerdistx = abs(oDogPaddler.x - x);
	var playerdisty = abs(oDogPaddler.y - y);
	var disttowards = point_distance(x,y,oDogPaddler.x,oDogPaddler.y)
	if (disttowards < 2*distbuffer)
	{
		hsp = playerdirx*walksp;
		vsp = playerdiry*walksp;
	}
	else
	{
		if (playerdistx < distbuffer)
		{
			hsp = 0;
		}
		else
		{
		
			hsp = playerdirx*walksp;
		}
	
		if (playerdisty < distbuffer)
		{
		
			vsp = 0;
		}
		else
		{
			vsp = playerdiry*walksp;
		
		}
	}
}