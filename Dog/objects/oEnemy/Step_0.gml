/// @description Insert description here
// You can write your code in this editor
enemyvariablereset();


/*
//If going to battle scene, exit?
if (instance_exists(Paddler.battlewarp))
{
	exit;
}
*/

//If enemy is in aggro, walk faster
if (state = estates.aggro)
{
	walksp = 4;
}
else
{
	walksp = 2;
	
}

//If player is in range, and if the player is moving, go aggro
var playerdist = point_distance(x,y,oDogPaddler.x,oDogPaddler.y);
if (playerdist < detectrange && state != estates.aggro)
{
	state = estates.alert
}

//IDLE STATE
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
	
}
//WANDER STATE
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
	
}
//ALERT STATE
else if (state = estates.alert)
{
	sprite_index = spritealert;
	
	movement_collision();	
	//var secs = 0.2;
	
	//Create alert sign
	if (myalertsign = noone)
	{
		myalertsign = instance_create_layer(x,y-100,"effects",alertsign);
		myalertsign.myuser = id;
	}
	
	//After a set time, go to aggro state
	/*
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
	*/
	
}
//AGGRO STATE
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