
#region animation states

if (animstate == panimstates.idle)
{
	sprite_index = idlesprite;
	idleanim = 1;
	nlandanim = 0;
	startupcount = 0;
	winddowncount = 0;
	nlandcount = 0;
	njumpcount = 0;
	winddownanim = 0;
	fjumpcount = 0;
	flandcount = 0;
	fjumpanim = 0;
	flandanim = 0;
	startupconfirm = 1;
	runanim = 0;
}
else if (animstate == panimstates.startup)
{	
	sprite_index = startupsprite;
	
	
}
else if (animstate == panimstates.run)
{
	idleanim = 0;
	nlandanim = 0;
	nlandcount = 0;
	njumpcount = 0;
	winddownanim = 0;
	startupcount += 1;
	winddowncount = 0;
	fjumpcount = 0;
	flandcount = 0;
	fjumpanim = 0;
	flandanim = 0;
	
	
	
	if (startupcount < 2) 
	{
		sprite_index = startupsprite;
		image_index = 0;
		
	}
	else if (startupcount<startupframes) 
	{
		sprite_index = startupsprite;
		
	}
	
	else
	{
		sprite_index = runsprite;
		
		runanim = 1;
	}
	
	
	
	
}
else if (animstate == panimstates.winddown)
{
	idleanim = 0;
	nlandanim = 0;
	nlandcount = 0;
	njumpcount = 0;
	winddownanim = 1;
	startupcount = 0;
	winddowncount += 1;
	fjumpcount = 0;
	flandcount = 0;
	fjumpanim = 0;
	flandanim = 0;
	runanim = 0;
	if(winddowncount < 2)
	{
		sprite_index = winddownsprite;
		image_index = 0;
		
	}
	else if (winddowncount < winddownframes)
	{
		sprite_index = winddownsprite;
	}
	else
	{
		sprite_index = idlesprite;
		startupconfirm = 1;
	}
	
	
	
}
else if (animstate == panimstates.neutraljump)
{
	idleanim = 0;
	nlandanim = 0;
	startupcount = 0;
	winddowncount = 0;
	nlandcount = 0;
	njumpcount += 1;
	fjumpcount = 0;
	flandcount = 0;
	fjumpanim = 0;
	flandanim = 0;
	runanim = 0;
	if (njumpcount < 2)
	{
		sprite_index = neutraljumpsprite;
		image_index = 0;
	}
	else if (njumpcount < njumpframes)
	{
		sprite_index = neutraljumpsprite;
		
	}
	else
	{
		sprite_index = neutralfallsprite;
		
	}
	
	
}
else if (animstate == panimstates.neutralland)
{
	idleanim = 0;
	nlandanim = 1;
	winddownanim = 0;
	startupcount = 0;
	winddowncount = 0;
	njumpcount = 0;
	nlandcount += 1;
	fjumpcount = 0;
	flandcount = 0;
	fjumpanim = 0;
	flandanim = 0;
	runanim = 0;
	if (nlandcount < 2)
	{
		sprite_index = neutrallandsprite;
		image_index = 0;
		
	}
	else if (nlandcount < nlandframes)
	{
		sprite_index = neutrallandsprite;
		
		
	}
	else
	{
		sprite_index = idlesprite;
		
		
	}
	
	
}
else if (animstate = panimstates.forwardjump)
{
	idleanim = 0;
	nlandanim = 0;
	winddownanim = 0;
	startupcount = 0;
	winddowncount = 0;
	njumpcount = 0;
	flandcount = 0;
	flandanim = 0;
	runanim = 0;
	startupconfirm = 0;
	
	fjumpcount += 1;
	if (fjumpcount < 2)
	{
		sprite_index = forwardjumpstartsprite;
		image_index = 0;
		
	}
	else if (fjumpcount < fjumpframes)
	{
		sprite_index = forwardjumpstartsprite;	
		
	}
	else
	{
		sprite_index = forwardjumpsprite;
		
	}
}
else if (animstate = panimstates.forwardland)
{
	idleanim = 0;
	nlandanim = 0;
	winddownanim = 0;
	
	winddowncount = 0;
	njumpcount = 0;
	fjumpcount = 0;
	fjumpanim = 0;
	
	startupconfirm = 0;
	
	
	flandcount += 1;
	if (flandcount < 2)
	{
		sprite_index = forwardlandsprite;
		image_index = 0;
		flandanim = 1;
		
	}
	else if (flandcount < flandframes)
	{
		sprite_index = forwardlandsprite;
		flandanim = 1;
		
	}
	else if (follow.move == 0) 
	{
		animstate = panimstates.winddown;
		flandanim = 0;
		startupcount = 0;
	}
	else if (follow.move != 0)
	{
		startupcount = startupframes;
		flandanim = 0;
	}
}

ds_queue_enqueue(yamqueue, hsp)
ds_queue_enqueue(yamqueue, vsp)
ds_queue_enqueue(yamqueue, grounded)

if (ds_queue_size(yamqueue)>3)
{
	prevframehsp = ds_queue_dequeue(yamqueue);
	prevframevsp = ds_queue_dequeue(yamqueue);
	prevframegrounded = ds_queue_dequeue(yamqueue);
	
	
}

hacceleration = abs(hsp) - abs(prevframehsp);
vacceleration = abs(vsp) - abs(prevframevsp);











#endregion



if (macrostate1 == party1macrostates.followplayer)
{
	knockbackcount = 0;
	
	
	ds_queue_clear(followqueue2)
	
	if (abs(vacceleration) != 1.40)
	{
		grounded = 1;
	}
	else
	{
		grounded = 0;
		
		
	}
	
	slidecount = 0;

	
	slidestartcount = 0;
	
	if (place_meeting(x,bbox_top,oWater))
	{
		macrostate1 = party1macrostates.swim;
		
		vsp = 35;
		
		
	}
	
	
	#region
	movingplatform()
	
	slidecount = 0;
	
	
	
	
	
	
	if (hsp != 0)
	{
		image_xscale = sign(hsp)*scale;
	
	}

	
onewaystarting()

	movement_collision();

onewayending()
	if (collision = 1)
	{
		canjump = 1;
	}



	var distance = point_distance(x,y,follow2.x,follow2.y);

	if (place_meeting(x,y+3,oSlope))
	{
		macrostate1 = party1macrostates.slidefollow;
			
	}
	ds_queue_enqueue(followqueue,oPlayer.downjump);
	
	
	if (ds_queue_size(followqueue) > 3)
	{
		downjump = ds_queue_dequeue(followqueue);


		
	}
	
	
	
	
		

	
	


	if (distance > lostrange) and (follow.collision = 1) and (follow.state = states.Playernormal)
	{
		state = party1states.reposition;
	
	}



	hsp += move * walksp;
	hsp *= movefriction;

	vsp = vsp +grv;

	if(abs(hsp) < 1)
	{
		hsp = 0;
	}
	distancePlayer = follow2.x - x;
	distancePlayerheight = follow2.y - y;
 
	if (state == party1states.chase)
	{
		#region
		
		letgocount += 1;
		
		if (follow2.move == 0)
		{
		
			state = party1states.wait;
			
		}
		
		
		
		
		
		move = sign(distancePlayer);
		/*
		if (follow.move != 0) and (place_meeting(x+(sign(image_xscale)*30),y,oWall)) and ((follow.y - y) < 0)and (place_meeting(x,y+2,oWall))
		{
			vsp = -30;
			
		}*/
		
		
	/*
		if (place_meeting(x+(move * ledgedetectrange),y,oWall)) and (distancePlayerheight < -100) and (canjump != 0)
		{
		
			canjump -= 1;
		
			vsp = -jumpstrength;
		
		}
		else if (abs(distancePlayer) < 200)
		{
		
			if (distancePlayerheight < -100) and (canjump != 0)
			{
				canjump -= 1;
			
				vsp = - jumpstrength;
			}
		
		
		}*/
		
		topdetect = collision_line(x,bbox_top,x,bbox_top - 200, oWall,true,true);
		if (follow2.y-y < -300) and (canjump != 0) and (topdetect == -4)
		{
			
			vsp = - jumpstrength;
			
			
		}
		
		if (place_meeting(x,y+2,oWall))
		{
			canjump = 1;
			
			
		}
		else
		{
			
			canjump = 0;
			
		}
		
		
		
		
	
	
		#endregion
	
	
	}
	else if (state == party1states.wait)
	{
	
		#region
		if (distance > detectrange) and (follow2.move != 0)
		{
		
			state = party1states.chase;
			
		}
		else if (distance > 300)
		{
		
			state = party1states.chase;
			
		}
	
		move = 0;
		
	
	
		#endregion
	
	}else if (state == party1states.reposition)
	{
		#region
		vsp += grv;
		hsp = 0;
		x = follow.x;
		y = follow.y - 100;
		
		state = party1states.wait;
	
		#endregion
	}
	
	
	
	
	
	
	
	#endregion
	
	/*if (grounded == 0) and (follow.move != 0)
	{
		animstate = panimstates.forwardjump;
		
	}
	else*/ if (grounded == 0) // and (follow.move == 0)
	{
		animstate = panimstates.neutraljump;
	}
	else if (grounded == 1) and (prevframegrounded == 0) and (abs(hsp)> 10)
	{
		
		animstate = panimstates.forwardland;
	}
	else if (oPlayer.move = 0) and (grounded == 1) and (prevframegrounded == 0) and (abs(hsp) < 10)
	{
		animstate = panimstates.neutralland;
		
	}
	else if (oPlayer.move = 0) and (hsp != 0) and (grounded == 1) and (distance < 300) and (nlandanim != 1) and (flandanim != 1) and (idleanim == 0)
	{
		animstate = panimstates.winddown;
		
	}
	else if (hsp == 0) and (grounded == 1) and (winddownanim != 1) and (nlandanim != 1) and (flandanim != 1)
	{
		animstate = panimstates.idle;
		
	}
	else if (hacceleration >= 0) and (grounded == 1)  and (flandanim != 1) and (move != 0)//and (abs(hsp) > 10)
	{
		
		
		animstate = panimstates.run;
		
		
	}

	
	
	
	
	
	
	
	
	
	
}
else if (macrostate1 == party1macrostates.playable)
{
	
	
	
}
else if (macrostate1 == party1macrostates.idle)
{
	#region
	
	movement_collision()
	vsp += grv;
	var distance = point_distance(x,y,follow.x,follow.y);
	
	if (distance < detectrange)
	{
		macrostate1 = party1macrostates.followplayer;
		
		
	}
	
	#endregion
	
}
else if (macrostate1 == party1macrostates.npc)
{
	
	
	
	
}
else if (macrostate1 == party1macrostates.slidefollow)
{
	
	slidecount += 1;
	
	if (slidecount < 2)
	{
		
		sprite_index = slidestartsprite;
		image_index = 0;
		
	}
	else if (slidecount < slideframes)
	{
		
		sprite_index = slidestartsprite;
	}
	else
	{
		
		sprite_index = slidesprite;
		
	}
	
	slidingparty();
	
	
	
	#region
	
	/*
	
	
	movement_collision()
	ds_queue_enqueue(followqueue2,follow.x);
	ds_queue_enqueue(followqueue2,follow.y);
	ds_queue_enqueue(followqueue2,follow.image_xscale);
	if (ds_queue_size(followqueue2) > 20)
	{
		queuex = ds_queue_dequeue(followqueue2);
		queuey = ds_queue_dequeue(followqueue2);
		image_xscale = ds_queue_dequeue(followqueue2);
		
	}
	x = queuex;
	y = queuey;
	if (!place_meeting(x,y+3,oSlope))
	{
		slidecount += 1;
		if (slidecount > 10)
		{
			macrostate1 = party1macrostates.followplayer;
		}
		
		
 	}
	
	
	hsp = sign(image_xscale)*30;
	
	*/
	#endregion
	
	
	
	
}
else if (macrostate1 == party1macrostates.knockback)
{
	
	
	
	
	image_xscale = follow.image_xscale;
	onewaystarting();
	movement_collision();
	
	
	knockbackcount += 1;
	
	
	if (knockbackcount < 2)
	{
		sprite_index = neutraljumpsprite;
		image_index = 0;
	}
	else if (knockbackcount < njumpframes)
	{
		sprite_index = neutraljumpsprite;
		
	}
	else
	{
		sprite_index = neutralfallsprite;
		
	}
	


	
	
	vsp = vsp + grv;
	
	
	
	if (place_meeting(x,y+vsp,oWall))
	{
		macrostate1 = party1macrostates.followplayer;
		
		
	}
	
	
	
}
else if (macrostate1 == party1macrostates.blank)
{
	sprite_index = sBlank;
	
	startupcount = 0;
	winddowncount = 0;
	njumpcount = 0;
	nlandcount = 0;
	fjumpcount = 0;
	flandcount = 0;
	
	
}
else if (macrostate1 == party1macrostates.swim)
{
	var distplayerswimx = abs(follow.x-x);
	var distplayerswimy = abs(follow.y-y);
	
	if (follow.move != 0) and (distplayerswimx > 100)
	{
		move = sign(follow.x - x)
		
		
	}
	else
	{
		move = 0;
		
		
		
	}
	
	if (follow.move != 0) and (distplayerswimy > 100)
	{
		
		vmove = sign(follow.y-y);
		
	}
	else
	{
		
		vmove = 0;
		
		
	}
	
	hsp += move*walksp;
	vsp += vmove*walksp;
	hsp *= 0.9;
	vsp *= 0.9;
	x += hsp;
	
	y += vsp;
	
	
	if (!place_meeting(x,bbox_top,oWater))
	{
		macrostate1 = party1macrostates.followplayer;
		vsp = -jumpstrength*0.7;
		
	}
	if (hsp!= 0)
	{
		image_xscale = sign(hsp)*scale;
		
	}
	
	
	
}