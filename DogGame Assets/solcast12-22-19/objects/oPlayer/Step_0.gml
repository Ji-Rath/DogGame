//Player input
if (state = states.Playeremptynormal)
{
	if (place_meeting(x+hsp,y+vsp,oSpikes))
	{
		state = states.Playerknockbackempty
		kbhsp= -sign(image_xscale)*10
		kbvsp = -25;
	}

}
else 
{
	if (place_meeting(x+hsp,y+vsp,oSpikes))
	{
		state = states.PlayerKnockback
		kbhsp = -sign(image_xscale)*10
		kbvsp = -25;
	}
	
}
///movement wrap
if (instance_exists(loopmarker))
{
	if (x > room_width)
	{
		x = 0;
		if (instance_exists(oMob))
		{
			with (oMob)
			{
				x = x - 4000;
				
			}
			
			
		}
		if (instance_exists(oHeal))
		{
			with (oHeal)
			{
				x = x - 4000;
				
			}
			
		}
		
		
		if (instance_exists(oLoop))
		{
			with (oLoop)
			{
				x = x- 4000;
				
			}
			
		}
		/*
		if (instance_exists(oStar))
		{
			with (oStar)
				{
			
					if (state = 1)
					{
						x = x-4000;
				
					}
			
				}
		}
		*/
	
	}
	if (x < 0)
	{
		x = room_width;
		if (instance_exists(oMob))
		{
			with (oMob)
			{
				x = x + 4000;
				
			}
			
			
		}
		if (instance_exists(oHeal))
		{
			with (oHeal)
			{
				x = x + 4000;
				
			}
			
		}
		
		if (instance_exists(oLoop))
		{
			with (oLoop)
			{
				x = x+ 4000;
				
			}
			
		}
		/*
		if (instance_exists(oStar))
		{
			with (oStar)
				{
			
					if (state = 1)
					{
						x = x+4000;
				
					}
			
				}
		}
		*/
		
	}
}

	#region input
	
	
	//Save screenshot when user presses enter


	
	if (!instance_exists(obj_textbox))
	{
		
		key_left_pressed = keyboard_check_pressed(bind_left)
		key_right_pressed = keyboard_check_pressed(bind_right)
		
		
		key_down = keyboard_check(bind_down);
		key_downreleased = keyboard_check_released(bind_down);
		
		if (inputstop != true)
		{
			key_left = keyboard_check(bind_left);
			key_right = keyboard_check(bind_right);
			key_leftreleased = keyboard_check_released(bind_left);
			key_rightreleased = keyboard_check_released(bind_right);
			key_jump = keyboard_check_pressed(bind_jump);
			key_jumphold = keyboard_check(bind_jump)
		}
		else
		{
			key_leftreleased = false;
			key_rightreleased = false;
			key_left = false;
			key_right = false;
			key_jump = false
			key_jumphold = false
			
		}
		
		key_action = keyboard_check(bind_action);
		key_actionreleased = keyboard_check_released(bind_action);
		key_actionpressed = keyboard_check_pressed(bind_action);
		key_parry = keyboard_check_pressed(bind_parry);
		key_parrycheck = keyboard_check(bind_parry);
		key_downpressed = keyboard_check_pressed(bind_down);
		key_p1 = keyboard_check(bind_p1);
		key_p2 = keyboard_check(bind_p2);
		key_p3 = keyboard_check(bind_p3);
		key_p1pressed = keyboard_check_pressed(bind_p1);
		key_p2pressed = keyboard_check_pressed(bind_p2);
		key_p3pressed = keyboard_check_pressed(bind_p3);
		key_dogpressed = keyboard_check_pressed(bind_dog);
	}
	else
	{
		key_left = 0;
		key_left_pressed = 0;
		key_right_pressed = 0;
		key_right = 0;
		key_jump = 0;
		key_jumphold = 0;
		key_down = 0;
		key_downreleased = 0;
		key_leftreleased = 0;
		key_rightreleased = 0;
		key_action = 0;
		key_actionreleased = 0;
		key_actionpressed = 0;
		key_parry = 0;
		key_parrycheck = 0;
		key_downpressed = 0;
		key_p1 = 0;
		key_p2 = 0;
		key_p3 = 0;
		key_p1pressed = 0;
		key_p2pressed = 0;
		key_p3pressed = 0;
		key_dogpressed = 0;
		
		
		
		
		
	}
	
	if (abs(gamepad_axis_value(0,gp_axislh))>0.2)
	{
		
		key_left = sign(abs(min(gamepad_axis_value(0,gp_axislh),0)));
		key_right = sign(max(gamepad_axis_value(0,gp_axislh),0));
		
		
		
	}
	
	if (abs(gamepad_axis_value(0,gp_axislh)) = 0) and (hsp != 0)
	{
		axisreleasecount += 1;
		if (axisreleasecount < 2)
		{
			key_leftreleased = 1;
			key_rightreleased = 1;
			
		}
		
	}
	
	if (hsp == 0)
	{
		axisreleasecount = 0;
		
	}

	
	if (gamepad_button_check_pressed(0,gpbindjump))
	{
		key_jump = 1;
		
		
	}
	if (gamepad_button_check_pressed(0,gpbindparry))
	{
		key_parry = 1;
		
		
		
	}
	if (gamepad_button_check(0,gpbindparry))
	{
		key_parrycheck = 1;
		
	}
	
	if (gamepad_button_check_pressed(0,gpbinddog))
	{
		key_dogpressed = 1;
		
		
	}
	
	if (gamepad_button_check_pressed(0,gpbindp1))
	{
		key_p1pressed = 1;
		
		
	}
	
		if (gamepad_button_check_pressed(0,gpbindp2))
	{
		key_p2pressed = 1;
		
		
	}
	
	if (gamepad_button_check_pressed(0,gpbindaction))
	{
		key_actionpressed = 1;
		
		
	}
	
	if (gamepad_button_check_released(0,gpbindaction))
	{
		key_actionreleased = 1;
		
		
	}
	
	if (gamepad_button_check(0,gpbindaction))
	{
		key_action = 1;
		
		
	}
	
	

	reset = keyboard_check(vk_alt);
	
	if (reset)
	{
		game_restart();
	}
	
	if mouse_check_button_pressed(mb_left)
   {
   if window_get_fullscreen()
      {
      window_set_fullscreen(false);
      }
   else
      {
      window_set_fullscreen(true);
	  display_reset(8,false)
      }
   }
	
	
	
	#endregion
	////sound
	

	
	
	
	
	
	
	
	
	
	
	
/*
if (instance_exists(oHeal))
{
	if (instance_number(oHeal)>4)
	{
		reapercount ++;
		var amnt = 3;
		var reaperloc = 700
		if (reapercount < amnt+1)
		{
			reaper = instance_create_layer(x+reaperloc,y+reaperloc,"mob",oShinigami)
		
		}
	
	
	}

}
else
{
	reapercount = 0;
	
}*/


if(instance_exists(oPoint))
{
	with (oPoint)
	{
		if (place_meeting(x,y,other))
		{
			instance_destroy();
		
		}
	
	}
}



if (instance_exists(oStarTrigger))
{
	with (oStarTrigger)
	{
		if (place_meeting(x,y,other))
		{
			state = 1;
			
			
		}
		
		
	}
	
}
if (instance_exists(oTreasure))
{
	
	
	
	

	
	
	with (oTreasure)
	{
		var trange = 500;
		var trange2 = 100;
		
		var treasuredist = point_distance(x,y,other.x,other.y);
		if (instance_exists(oDog))
		{
			if (treasuredist < trange2)
			{
				oDog.treasuredetect = 2;
			
			}
			else if (treasuredist < trange)
			{
				oDog.treasuredetect = 1;
			}
			else
			{
				oDog.treasuredetect = 0;
			
			}
		
		}
		
		
	}
	
	
	
}

if (instance_exists(atmospheretrigger))
{
	atmospherecollision = place_meeting(x,y,atmospheretrigger);
	
}


if (state != states.stuck) 
{
	stuckcount = 0;
	
	
}
if (state != states.stuckgetup) 
{

	stuckgetupcount = 0;
	
}
var instcp = instance_place(x,y,savemodule)
if (instcp != noone)
{
	instcp.state = checkpointstates.on;
	game.lastcheckpoint = instcp;
}

//if (state != states.wallslide) wallslidecount = 0;
//if (state != states.Playernormal) normalcount = 0;
if (inputstop == true)
{
	move = 0;
	inputstopcount ++;
	
	
	if (inputstopcount < incsec * 60)
	{
		
		if (inputstopcount < 2)
		{
			inputrelease = true;
			
			
		}
		else
		{
			inputrelease = false;
			
		}
		
	}
	else
	{
		state = states.null;
		inputstop = false;
		
		
	}
	
	
	
}




if (ghosted == true)
{
	if (mysmoke = noone)
	{
		mysmoke = instance_create_layer(x,y,"parryspark",playersmoke);
		mysmoke.parent = id;
	}
}
else
{
	mysmoke = noone;
	
}


event_inherited() 
var inst = instance_place(x,y,oPortal);
if (inst != noone) and (state != states.Playeremptynormal)
{
	with(game)
	{
		if(!doTransition)
		{
			spawnRoom = inst.targetroom
			doTransition = true;
			spawnx = inst.targetx;
			spawny = inst.targety;
		}
	}
	
	
	
	
}


var checkpointinst = instance_place(x,y,checkpoint)

if (checkpointinst != noone)
{
	saveinfo();
	
	
}

if (doghere == true)
{
	if (dog == noone)
	{
		dog = instance_create_layer(x,y,"dog",oDog)
		
	}
	
}



var chestinst = instance_place(x,y,oChest)
if (chestinst != noone) and (key_actionpressed) and (game.juststarted = true) and (!instance_exists(obj_textbox))
{
	state = states.chest;
	
}

if(state!= states.chest)
{
	chestcount = 0;
	
}

if (instance_exists(stats))
{
	
	phealth = stats.phealth;
}

var healinst = instance_place(x,y,oHeal);


if (healinst != noone)
{
	healinst.state = 1;
	



	


}
///Save screenshot of the current running room when user presses enter

if (iframestate == iframes.inactive)
{
	
	invincible = false;
	iframecount = 0;
	image_alpha = mainalpha;
	
}
else if (iframestate == iframes.active)
{
	iframecount += 1;
	if (iframecount > 90)
	{
		iframestate = iframes.inactive;
		
		
	}
	
	invincible = true;
	
	if (image_alpha = mainalpha)
	{
		image_alpha = 0;
		
	}
	else
	{
		image_alpha = mainalpha;
		
		
	}
	
	
}
else if (iframestate == iframes.activep)
{
	iframecount += 1;
	if (iframecount > 2*60)
	{
		iframestate = iframes.inactive;
		
		
	}
	
	invincible = true;
	image_alpha = mainalpha;
	
	
}


/*
if (keyboard_check_pressed(vk_shift))
{


surface_save(application_surface, "roomdsda.png");

} 
*/
if (phealth = 0)
{
	state = states.PlayerDeath;
	
	
	
}




	
	
	if (instance_exists(oDog))
	{
		dog = oDog;
		
	}
	
	

// STATES
if(state ==	states.Playernormal)
{
	
	/*
	normalcount += 1;
	
	if (place_meeting(x+(3*sign(hsp)),y,oWall)) and (normalcount > 30) and (!place_meeting(x,y+3,oWall))
	{
		state = states.wallslide
		image_xscale = -sign(image_xscale)*scale
		
	}*/
	
	
	sound_movement();
	/*
	var runsnd = runningsfx;
	if (place_meeting(x,y+3,oWall))
	{
		
		if (move != 0)
		{
			movecount += 1;
			if (movecount = 1)
			{
			var vol = 0.5;
			audio_play_sound(runsnd,501,true);
			audio_sound_gain(runsnd,vol,0)
			audio_sound_gain(runsnd,vol,0)
			}		
				
		
		}
		else if (key_leftreleased) or (key_rightreleased) or (move = 0)
		{
			
			audio_stop_sound(runsnd)
			
			
		}
	

	}
	else
	{
		audio_stop_sound(runsnd)
		
	}
	*/
	
	if (place_meeting(x,y+3,oWall))
	{
		groundtouch = true
		
	}
	else
	{
		groundtouch = false
	}
	
	if (groundtouch == false) and (vsp > 0)
	{
		airtime += 1;
		
	}
	else if (vsp < 0) or (groundcount > 1)
	{
		airtime = 0;
		
	}
	
	if (groundtouch = true)
	{
		groundcount += 1
		
	}
	else
	{
		groundcount = 0;
		
	}
	

	
	
	var airsecs = 1.5;
	
	if (airtime > 70)
	{
		if (place_meeting(x,y+2,oWall))
		{
			
			state = states.stuck;
			
			
		}
		
		
	}
	
	
	
	if (place_meeting(x,y+2,oDeathblock))
	{
		state = states.PlayerDeath;
		
		
	}
	death = noone;
	mybroomtrail = noone;
	throwcount = 0;
	
	onewaystarting();
	if (instance_exists(oDog))
	{
		
			if (key_dogpressed) and (dogthrow == noone)
			{
				state = states.PlayerThrowanim;
			}
		
			if (dogthrow == noone)
			{
				oDog.state = dogstates.follow2;
				
			}
		
		
		
		
	}
	if (instance_exists(oYam))
	{
		
		
		oYam.queuex = x;
		oYam.queuey = y;
		if (place_meeting(x,y+2,oWall))
		{
			canp1 = 1;
			canp2 = 1;
		
		}
		if (oYam.macrostate1 = party1macrostates.blank)
		{
			oYam.macrostate1 = party1macrostates.followplayer;
		}
		glidecount = 0;
	
		if (key_p1pressed) and (!place_meeting(x,y+2,oWall)) and (canp1 = 1) and (dogthrow = noone)
		{
			state = states.PlayerGlide
		
		
		}
	}
	
	if (instance_exists(oBarry1))
	{
		
		if (key_p2pressed) and (!place_meeting(x,y+2,oWall)) and (canp2 = 1) and (dogthrow = noone)
		{
			carrycount = 0;
			oBarry1.macrostate1 = party1macrostates.blank
			state = states.Carry;
			if (key_right)
			{
				image_xscale = scale;
				
			}
			else if (key_left)
			{
				image_xscale = -scale;
				
			}
			hsp = sign(image_xscale)*15;
			vsp = -30;
		
		
		}
		
	}
	
	
	
	
	if (place_meeting(x,bbox_top,oWater))
	{
		state = states.PlayerSwim;
		
		vsp = 35;
		
	}
	#region
	parrycount = 0;
	knockbackcount = 0;

	
	
	if (collision = 0)
	{
		runanim = 0;
		
	}
	
	
	
	#region normal
	boardcount = 0;
	slidestartcount = 0;
	boardbuffer = 1;
	
	image_angle = 0;
	// check if landing
	
	//state change
	
	
	if (canp3 = 1)
	{
		if (collision = 0) and (key_p3pressed)
		{
			state = states.Playerboard;
		
		}
	}


	
//////

if (place_meeting(x,y+3,oSlope))
{
	state = states.PlayerSlide;
	
}

if !place_meeting(x,y,oWall) && vsp >= 0 && place_meeting(x,y+2+abs(hsp),oWall) 
{
	while(!place_meeting(x,y+1,oWall)) 
	{
		y += 1;
	}
	
	
}



if (move != 0)
{
	gparryanim = 0;
	
}


if (collision = 0)
{
	gparryanim = 0;
	
}

////////////////////////////////////////oneway




	if ((landanim == 1) or (rollanim == 1) or (crouchanim == 1) or (key_jump)) 
	{
		downjumpbuffer = 0;
		downjumpcount = 0;
	}
	if (downjumpcount = 0)
	{
		downjump = 0;
		
	}
	
	
	if (key_down)
	{
		downjumpbuffer= 1;
			
	}
	

	
	
	
	if (downjumpbuffer = 1)
	{
		downjumpcount += 1;
		
		if (downjumpcount < 10) 
		{
			downjump = 1;
			
			
		}else {
			
			downjump = 0;
		}
		
	}
	
	




	

	

	
	

	

		
	

	
	kbvsp = -knockupstrength;	

	
	



	if (vsp > 0)
	{
		landing = 1;
	}
	else{
		landing = 0;
		}

	if (abs(hsp) > 0)
	{
		hmove = 1;
	}else
	{
		hmove = 0;
	}

	//movement
	if (inputstop != true)
	{
		move = key_right - key_left;
	}

	
	hsp += move * walksp;


	hsp *= movefriction;
	/*
	if (place_meeting(x,y+1,oMovingplatform))
	{
		
		x += oMovingplatform.hsp;
		//y = oMovingplatform.y-45;
		y += oMovingplatform.vsp-2;
		if (key_jump)
		{
			vsp = -jumpstrength;
			
		}
		
		
		
		
	}*/
	


	if(abs(hsp) < 1)
	{
		hsp = 0;
	}
	






	vsp = vsp +grv;

	


//collision variable
	if (place_meeting(x,y+vsp,oWall))
	{
		jumpable = 0;
		collision = 1;
	}else {
		collision = 0;
	}

	if (!place_meeting(x,y+1,oWall))
	{
		jumpable += 1;
		idleanim = 0;
		
		if (jumpable < 10)
		{
			if (key_jump)
			{
				vsp = -jumpstrength;
				
				
			}
			
		}
		
		
	}
	
	

	if (place_meeting(x,y+1,oWall)) and (key_jump)
	{
		fjumpstartcount = 0;
		
		
		vsp = -jumpstrength;
		
	}

//horizontal collision
#region collision movement





	if (place_meeting(x+hsp,y,oWall))
	{
		yplus = 0;
		while (place_meeting(x+hsp,y-yplus,oWall) and yplus <= abs(3*hsp))
		{
			
			yplus += 1;
			
		}
		
		
		
		if (place_meeting(x+hsp,y-yplus,oWall))
		{
			while (!place_meeting(x+sign(hsp),y,oWall))
			{
				x = x+sign(hsp);
			}

			hsp = 0;
				
				
			
		
			
			
		}
		else
		{
			y -= yplus;
			
		}
		


	
		
	}


	x = x + hsp;

	

	
	if (!place_meeting(x,y,oWall)) and (vsp >= 0) and (place_meeting(x,y+2+(2*abs(hsp)),oWall))
	{
		
		while (!place_meeting(x,y+1,oWall))
		{
			y += 1;
			
		}
		
	}
	
	
	
	
	


//vertical collision
	if (place_meeting(x,y+vsp,oWall))
	{
		while (!place_meeting(x,y+sign(vsp),oWall))
		{
			y = y+sign(vsp);  
  		}
		vsp = 0;
	}

     

	y  = y + vsp;



#endregion

//animation

//idle state condition
/*
	if (hsp == 0) and (place_meeting(x+(sign(image_xscale)*2),y,oWall))
	{
		touchx = true;
		
		
	}
	else
	{
		touchx = false;
		
	}*/

	if (hsp == 0) and (!key_left) and (!key_right) 
	{
		
		if (landanim == 0)
		{
			idle = 1;
		}
		else{
			idle = 0;
		}
		
	}
	else {
		idle = 0;
	}




//check for startup aninmation

////////////////////////////////////////////////////////////////////////////

// jumping animation


//parry stuff
#region 


	if (!place_meeting(x,y+1,oWall))
	{
	
	/*image_speed = 0;
	if (sign(vsp) > 0) image_index = 1; else image_index = 0;
	*/
		

		
		
		
#endregion 
		
		if (key_jump)
		{
			parrycount += 1;
		}
		
		if (key_leftreleased) or (key_rightreleased)
		{
			njumpcount = 2*8;
			image_index = 7;
		}
		
		winddownanim = 0;
		landanim = 0;
		rollanim = 0;
		crouchanim = 0;
		crouchriseanim = 0;
		
		
		if (move == 0)
		{
			
			njumpanim = 1;
			
			fjumpstartanim = 0;
			
		}
		
		else {
			fjumpstartanim = 1;
			njumpanim = 0;
			
		}
		
		/////wall grab
		dog = oDog;
		
		if (instance_exists (dog) )
		if (dog.state = dogstates.follow2)
		{
			cangrab = 1;
			
			
		
		}

		
		
		
	
		
		
		
		
		
		
		/////
		
		/*
		if (sign(vsp) < 0)
		{
			riseanim = 1;
		}
		else
		{
			fallstartanim = 1;
		}
		
		*/
	}
	else
	{//not in the air
		
		
		fjumpstartanim = 0;
		
		
		
		/*
		// idle 
		if (idle == 1)//not moving horizontally, movement keys arent pressed
		{
			idleanim = 1;
			runanim = 0;
			
		
		}
		*/
	
	}
	
	if (collision == 1)
	{
		
		parrycount = 0;
		
	}
	
	
	if (idle == 1)
	{
		if (collision == 1)
		{
			idleanim = 1;
			runanim = 0;
			
			
			
			
		}
	}
	else {
		idleanim = 0;
	}
	
	
	if (njumpanim == 1)
	{
		
		
		njumpcount += 1;
		
		
		if (njumpcount < 2)
		{
			sprite_index = sPlayerRise;
			image_index = 0;
		}
		
		if (njumpcount < njumpframes)
		{
			sprite_index = sPlayerRise;
			
		}
		else {
			
			sprite_index = sPlayerFall;
		}
		
	}
	
	
	
	
	
	
	if (place_meeting(x,y+1,oWall))
	{
		grounded = 1;
		
	}
	else
	{
		grounded = 0;	
		
	}

	ds_queue_enqueue(prevframequeue,vsp);

	if (ds_queue_size(prevframequeue)>2)
	{
		prevframegrounded = ds_queue_dequeue(prevframequeue);
		
		
	}


		
	if (grounded == 1) and (abs(hsp) > 10) and (prevframegrounded != 0) and (airtime < 80)
	{
		rollanim = 1;
		
	}
	else if (prevframegrounded != 0) and (grounded == 1) and (move == 0) and (rollset != 1)
	{
		
		landanim = 1;
		
	}
	else if (prevframegrounded != 0) and (grounded == 1) and (abs(move) > 0) and (airtime < 80)
	{
		rollanim = 1;
		
	}
	
	if (runanim == 1) or (winddownanim == 1) or (grounded == 0)
	{
		
		rollset = 0;
		
	}
	
	
	
	
	if (riseanim == 1)
	{
		sprite_index = sPlayerRise;
	}
	
	if (fallanim == 1)
	{
		sprite_index = sPlayerFall;
	}
	
	if (fallstartanim == 1) and (rollanim != 1) and (landanim != 1) and (winddownanim != 1) and (grounded != 1)
	{
		fallstartcount += 1;
		if (fallstartcount < 2)
		{
			sprite_index = sPlayerFallStart;
			image_index = 0;
		}
		else if (fallstartcount < fallstartframes)
		{
			sprite_index = sPlayerFallStart
		}
		else {
			sprite_index = sPlayerFall;
		}
	}
	
	
	// FORWARD JUMPING ANIMATION
	
	
	if (fjumpstartanim == 1) and (rollanim != 1) and (landanim != 1) and (grounded != 1)
	{
		fjumpstartcount += 1;
		if (fjumpstartcount < 2)
		{
			sprite_index = sPlayerFallStart;
			image_index = 0;
		}
		else if (fjumpstartcount < fjumpstartframes)
		{
			sprite_index = sPlayerFallStart// FORWARD START ANIM
		}
		else if (fjumpstartcount < (fjumpstartframes + 1)) 
		{
			sprite_index = sPlayerFjump;//FORWARD LOOPING PLACEHOLDER
			image_index = 0;
		}
		else {
			sprite_index = sPlayerFjump;
		}
	}
	else {
		
	}
	
	
	
	
	
	if (collision == 1)
	{
		fallstartcount = 0;
		fallstartanim = 0;
		riseanim = 0;
		njumpanim = 0;
		njumpcount = 0;
	}
	
	
	
	

	if (idleanim == 1)
	{
		sprite_index = sPlayer;
	}

	if (move != 0) and (collision = 1) and (rollanim == 0)
	{
		if (runanim != 1)
		{
			winddownanim = 0;
			startupanim = 1
		}
	
	}
	else {
		startupanim = 0;
	}


	if (runanim == 1) and (collision == 1)
	{
		sprite_index = sPlayerRun;
		
	}

	
	
	
	

	if (startupanim == 1)
	{
		startupcount += 1;
				
				
				
				
				if(startupcount < 2)
				{
					sprite_index = sPlayerStartup;
					image_index = 0;
				}
				else if (startupcount < 2*17)
				{
					sprite_index = sPlayerStartup;
				}
				else {
					runanim = 1;
				}
	}
	else {
		startupcount = 0;
		
		
		
		
	}

/*
if (move = 0)
{
	runanim = 0;
	startupcount = 0;
}*/
//winddown


/*
if (keyboard_check_released(vk_left) and (collision = 1)) or (keyboard_check_released(vk_right) and (collision = 1))
{
	winddownanim = 1;
	
}

*/

/*
if (abs(hsp) > 0) and (move = 0) and (collision = 1) and (sprite_index != sPlayerLand)
{
	winddownanim = 1;
	
	
}
*/


	


	if (key_leftreleased) or (key_rightreleased) or (inputrelease == true)
	{
		if (collision == 1) and (rollanim == 0)
		{
			runanim = 0;
			winddownanim = 1;
			startupcount = 0;
			
			winddowncount = 0;
			startupanim = 0;
			crouchcount = 0;
			crouchriseanim = 0;
			crouchanim = 0;
		}
	
	
	}
	
	

	
	
	if (winddownanim == 1) 
	{
		crouchriseanim = 0;
		rollanim = 0;
		startupanim = 0;
		runanim = 0;
		startupcount = 0;
		
		
		
		
		
		
		winddowncount += 1;
		
		if(winddowncount < 2)
		{
			sprite_index = sPlayerWinddown;
			image_index = 0;
		
		}
		
		else if (winddowncount < winddownframes)
		{
			sprite_index = sPlayerWinddown;
			
		}
		
		
	
	
	}
	else {
		winddownanim = 0;
		
		idle = 1;
		
	}

	

	
	
	
//landing
	
	
	if (collision == 1) 
	{
		
		
		
		if (landing == 1)
		{
			
			
			
			idleanim = 0;
			
			if (hmove == 1) and (key_right or key_left) 
			{
				
				
				
				rollanim = 1;
				
			}
			else if (fjumpstartcount > 10)
			{
				rollanim = 1;
				
			}
			else
			{
				landanim = 1;
			}
		
		}
	
	
	}
	
	
	//landing
	if (landanim == 1) and (move == 0)
	{
		fjumpstartanim = 0;
		fallstartanim = 0;
		
		winddownanim = 0;
		hsp = 0;
		landcount += 1;
		if (landcount < 2)
		{
			sprite_index = sPlayerLand;
			image_index = 0;
		}

		else {
			sprite_index = sPlayerLand;
		}
	
	}

	if (landanim == 0)
	{
		landcount = 0;
	}
	
	
	
		if (landanim == 1) 
	{
		winddownanim = 0;
		hsp = 0;
		landcount += 1;
		if (landcount < 2)
		{
			sprite_index = sPlayerLand;
			image_index = 0;
		}

		else {
			sprite_index = sPlayerLand;
		}
	
	}

	if (landanim == 0)
	{
		landcount = 0;
	}



	if (rollanim == 1)
	{
		
		//skip startup animation for run
		if (vsp < 0)
		{
			startupanim = 0;
		}
		
		landing = 0;// disable neutral landing animation
		crouchcount = 0;
		crouchriseanim = 0;
		crouchanim = 0;
		fallstartanim = 0;
		fallanim = 0;
		fallstartcount = 0;
		
		if (key_left) or (key_right)
		{
			winddownanim = 0;
			runanim = 1;
			njumpanim = 0;
			
			
			
		}
		if (landanim == 1)
		{
			
			rollanim = 0;
			
		}
		
		
		
		rollcount += 1;
		if (rollcount < 2)
		{
			winddowncount = 0;
			winddownanim = 0;
			sprite_index = sPlayerRoll;
			image_index = 0;
		}
		else if (rollcount < rollingframes)
		{
			winddowncount = 0;
			winddownanim = 0;
			sprite_index = sPlayerRoll;
		}
		else {
			rollanim = 0;
			winddownanim = 1;
		}
		
	}


	if (move != 0)
	{
		winddownanim = 0;
	}


	if (hsp != 0 ) 
	{
		image_xscale = sign(hsp)*scale;
	}
//crouching





	if (crouchanim == 1)
	{
	/*
	//disable startuprun aninmation from crouching
	runanim = 1;
	startupanim = 0;
	*/
		landanim = 0;
	
		crouchcount += 1;
		if (crouchcount < 2)
		{
			sprite_index = sPlayerCrouch;
			image_index = 0;
		}
		else if (crouchcount < crouchframes)
		{
			sprite_index = sPlayerCrouch;
		}
		else
		{
			sprite_index = sPlayerCrouch;
			image_index = image_number - 1;
		}
		
	}


	

	
	if (crouchriseanim == 1)
	{
		idleanim = 0;
		crouchrisecount += 1;
		if (crouchrisecount < 2)
		{
			sprite_index = sPlayerCrouchRise;
			image_index = 0;
		}
		else {
			sprite_index = sPlayerCrouchRise;
		}
		

	}
	

	

	if (crouchriseanim == 0)
	{
		crouchrisecount = 0;
	}

	if (abs(move) == 1) and (collision == 0)
	{
		landanim = 0;
	}

	if (key_left) or (key_right)
	{
	
	//disable animations while movement keys are down
		landanim = 0;
		crouchriseanim = 0;
	
	}

	if (key_jump)
	{
		runanim = 0;
		crouchriseanim = 0;
		idleanim = 0;
		rollanim = 0;
	}

	if (rollanim == 0)
	{
		rollcount = 0;
	}
	

	
	


	image_speed = 1;
	

	
	
	
	#endregion
	
	
	if (key_parry) and (oParry.state = parrystates.inactive)
	
	{
		oParry.state = parrystates.active;
		
	}
	
	
	
	
	
	onewayending();
	#endregion
	

	
	
	
} 
else if (state == states.Playersleep)

{
	#region sleep
	
	movement_collision()
	if (place_meeting(x,y+1,oWall))
	{
		vsp = 0;
		
		
	}
	else
	{
		vsp += 100;
		
	}
	
	move = 0;
	landing = 0;
	landanim = 0;
	
	sleepanim = 1;
	wakeupcount = 0;

	
	if (sleepanim == 1)
	{
		sprite_index = sPlayerSleep;
	}
	if (!place_meeting(x,y,oFlower))
	{
		if (key_action)
		{
			state = states.PlayerWakeup;
		
		
		
		}
	}
	
	
	
	
	
	
	#endregion
		
} 
else if (state == states.PlayerWakeup)

{
	#region wakeup
	vsp = 0;
	landanim = 0;
	wakeupcount += 1;
		
	if (wakeupcount < 2)
	{
		sprite_index = sPlayerWakeup;
			image_index = 0;
	}
	else if (wakeupcount < wakeupframes)
	{
		sprite_index = sPlayerWakeup
	}
	else if (instance_exists(oFlower))
	{
		state = states.null;
		
	}
	else
	{
		state = states.Playernormal;
		
	}
	
	
	
	#endregion
} 
else if (state == states.PlayerKnockback)

{
	stopsoundmovement();
	
	
	movement_collision();
	

	airtime += 1;
	
	if (instance_exists(oYam))
	{
		if (oYam.macrostate1 = party1macrostates.blank)
		{
			oYam.macrostate1 = party1macrostates.knockback;
		}
		
	}
	if (dogthrow == noone)
	{
		if (instance_exists(oDog))
		{
			oDog.state = dogstates.follow2;
			
			
			
		}
		
		
	}
	
	if (instance_exists(oBarry1))
	{
		with (oBarry1)
		{
			if (macrostate1  = party1macrostates.blank)
			{
				macrostate1 = party1macrostates.followplayer
				state = party1states.chase;
				
			}
			
		}
		
	}
	#region
	onewaystarting();
	
	image_speed = 1;
	#region knockback
	
	hsp = 0;
	vsp = 0;
	idleanim = 1;
	winddownanim = 0;
	kbvsp = kbvsp +grv;




//collision variable
	if (place_meeting(x,y+kbvsp,oWall))
	{
		collision = 1;
	}else {
		collision = 0;
	}



	

//horizontal collision
	if (place_meeting(x+kbhsp,y,oWall))
	{
	
		while (!place_meeting(x+sign(kbhsp),y,oWall))
		{
			x = x+sign(kbhsp);
		}
	kbhsp = 0;
	}



	x  = x + kbhsp;

	



//vertical collision
	if (place_meeting(x,y+kbvsp,oWall))
	{
		while (!place_meeting(x,y+sign(kbvsp),oWall))
		{
			y = y+sign(kbvsp);  
  		}
		kbvsp = 0;
		
		state = states.Playernormal;
		
		if (rollset == 1)
		{
			rollanim = 1;
		
		}
		else 
		{
			rollanim = 0;
			landanim = 1;
		
		}
		
		
		
	}

     

	y  = y + kbvsp;
	
	if (key_right) or (key_left)
	{
		landanim = 0;
		landing = 0;
		rollset = 1;
		
		
	}
	else
	{
		rollset = 0;
		
	}

	grounded = 0;


	
	
	
	

	
	
	
	////
	
	if ((-(sign(kbhsp)))== 1)
	{
		kbldirection = -1;
		
	}
	else if ((-(sign(kbhsp)))== -1)
	{
		kbldirection = 1;
		
	}
	
	kblhsp = kbldirection*kblandingstrength;

	
	
	#endregion
	crouchanim = 0;
	crouchriseanim = 0;
	knockbackcount += 1;
	if (knockbackcount < 5)
	{
		sprite_index = sPlayerHurt;
		image_index = 0;
		if (knockbackcount < 2)
		{
			audio_play_sound(hurtsfx,501,false)
			
		}
		
	}
	else if (knockbackcount < 6)
	{
		sprite_index = sPlayerRise;
		
		image_index = 5;
	}
	else if (knockbackcount <6 + njumpframes - 14)
	{
		sprite_index = sPlayerRise;
		
	}
	else
	{
		sprite_index = sPlayerFall;
		
		
	}
	
	
	
	
	
	
	
	onewayending();
	#endregion
	if (knockbackcount < 2)
	{
		ScreenShake(knockbackmagnitude,30)
		
	}
	
	if (knockbackcount > 6) and (knockbackcount < 8)
	{
		if(iframestate = iframes.inactive)
		{
			stats.phealth -= 1;
			iframestate = iframes.active;
			if(heartshatter == noone)
			{
				heartshatter = instance_create_layer(0,0,"parryspark",oHeartshatter)
			
			
			}
		
		}

		
		
		
		
		
	}
} 
else if (state == states.PlayerKnockbacklanding)

{
	#region knockbacklanding
	
	
	
	hsp = 0;
	vsp = 0;
	idleanim = 1;
	winddownanim = 0;
	kblvsp = kblvsp +grv;


	kblhsp *= movefriction/1.15;
	
	


	if(abs(kblhsp) < 1)
	{
		kblhsp = 0;
		state = states.Playernormal;
		
	}

//collision variable
	if (place_meeting(x,y+kblvsp,oWall))
	{
		collision = 1;
	}else {
		collision = 0;
	}



	

//horizontal collision
	if (place_meeting(x+kblhsp,y,oWall))
	{
	
		while (!place_meeting(x+sign(kblhsp),y,oWall))
		{
			x = x+sign(kblhsp);
		}
	kblhsp = 0;
	}



	x  = x + kblhsp;

	



//vertical collision
	if (place_meeting(x,y+kblvsp,oWall))
	{
		while (!place_meeting(x,y+sign(kblvsp),oWall))
		{
			y = y+sign(kblvsp);  
  		}
		kblvsp = 0;
		
		
	}

     

	y  = y + kblvsp;
	
	
	#endregion
} 
else if (state == states.PlayerSlide)
{
	
	
	

	if (!place_meeting(x,y+3,oSlope))
	{
		state = states.Playernormal;
		
	}

	if (key_jump)
	{
		state = states.Playernormal;
		vsp = -jumpstrength;
	}
	
	#region slide
	slidestartcount += 1;
	

	
	
	
	if (slidestartcount <2)
	{

		
		sprite_index = sPlayerSlideStart;
		image_index = 0;
		
	}
	else if (slidestartcount < (2*14)-2)
	{
		
		sprite_index = sPlayerSlideStart;
		
	}
	else
	{
		sprite_index = sPlayerSlide;
		
	}
	
	
	
	if (place_meeting(x,y+30,oSlope))
	{
		
	
	}
	
	if (place_meeting(x+50,y,oSlope))
	{
		slopedir = -1;
		
		
		
		
	}
	else
	{
		slopedir = 1;
		
	}
	
	vsp += grv;
	if (slopedir == 1)
	{
		
		hsp += 1.5*walksp
		hsp *= movefriction
		
		
	}
	else if (slopedir == -1)
	{
		
		
		
		hsp -= 1.5*walksp
		hsp *= movefriction
	}
	


	
	image_xscale = sign(hsp)*scale;
	
	
	
	if (abs(hsp)> 40)
	{
		hsp = slopedir*40;
		
	}
	movement_collision()
	
	

	#endregion

	
	
	
} 
else if (state == states.Playerboard)
{
	
	#region board
	
	boardcount += 1;
	
	
	if (boardcount < 2)
	{
		hsp = sign(image_xscale)*100;
		
		
	}
	
	if (!place_meeting(x,y+3,oWall)) and (boardbuffer = 1)
	{
		canjump = 0;
		
		
		move = sign(image_xscale);
		
	}
	else
	{
		canjump = 1;
		move = slopedir;
		
	}
	
	
	if (place_meeting(x,y+3,oWall))
	{
		
		collision = 1;
		
	}
	else
	{
		collision = 0;
		
	}
	
	
	if (key_p3pressed)
	{
		state = states.Playernormal;
		
		
	}
	
	sprite_index = sPlayerboard;
	
	
	
	
	
	
	if (hsp != 0)
	{
		image_xscale = scale * sign(hsp);
		
	}
	
	movement_collision()
	hsp += move*boardsp;
	hsp*= movefriction;
	
	vsp += grv;
	
	if (key_jump) and (collision = 1) 
	{
		vsp = -jumpstrength;
		boardbuffer = 0;
		
	}

	
	
	
	if (place_meeting(x-3,y,oWall)) 
	{
		slopedir = 1;
		
		
	}
	else if (place_meeting(x+3,y,oWall)) 
	{
		slopedir = -1;
		
		
	}
	else
	{
		slopedir = 0;
		
		
	}
	
	/*
	if (slopedir != sign(image_xscale)) and (hsp != 0) 
	{
		hsp -= sign(hsp)*2;
		slopingbuffer = 0;
		if (abs(hsp)<4)
		{
			hsp = 0;
			
			
		}
		
		
	}
	else 
	{
		slopingbuffer = 1;
		
	}*/
	
	
	#endregion
	
	dog.state = dogstates.blank;
	
	
	
	
} 
else if (state == states.Playerparry)
{
	#region
	canp1 = 1;
	canp2 = 1;
	
	
	iframestate = iframes.activep;
	iframecount = 0;
	airtime = 0;
	move = key_right - key_left;
	
	if (instance_exists(oDog))
	{
		oDog.bumpoffcount = 0;
		
	}
	
	parrycount += 1;
	/*
	if (parrycount < 2)
	{
		ScreenShake(parrymagnitude,30)
		
	}
	*/
	
	if (parrycount > 6)
	{
		state = states.Playernormal;
		
	}
	if (collision = 0)
	{
		sprite_index = sPlayerParry;
		hsp = move*40;
		vsp = -1.2*jumpstrength;
		
	}
	
	else 
	{
		
		sprite_index = sPlayerGParry;
		image_index = 0;
	
		landanim = 1;
		
		
	}
	
	#endregion
	
	
	
	
} 
else if (state == states.PlayerGlide)
{
	airtime = 0;
	
	if (instance_exists(oDog))
	{
		oDog.Fjumpcount = 0;
		oDog.queuex = x;
		oDog.queuey = y;
		
	}
	
	
	if (hsp != 0)
	{
		image_xscale = sign(hsp)*scale;
		
		
	}
	
	
	if (glidecount < 2)
	{
		sprite_index = sYamBroom;	
		image_index = 0;
	}
	else if (glidecount < glideframes)
	{
		sprite_index = sYamBroom;
	}
	else
	{
		sprite_index = sYamBroomloop;
	}
	
	if (mybroomtrail == noone) and (glidecount < 2)
	{
		
		mybroomtrail = instance_create_layer(x,y,"parryspark",oBroomtrail);
		
		
		
	}
	
	#region
	onewaystarting();
	movement_collision();

	
	#region
	
	oYam.x = x;
	oYam.y = y;

	if (move != 0)
	{
		glidecount += 1;
		vsp = 5;
		if (glidecount < 2*5)
		{
			hsp = 0.5*sign(move)*100;
		
		}
		else if (glidecount < 2*9)
		{
			hsp = 0.5*sign(move)*90;
		}
	
		else if (glidecount < 2*13)
		{
			hsp = 0.5*sign(move)*80;
		
		}
		else if (glidecount < 2*17)
		{
		
			hsp = 0.5*sign(move)*70;
		}
		else if (glidecount < 2*21)
		{
		
			hsp = 0.5*sign(move)*60;
		}
		else if (glidecount <2* 25)
		{
		
			hsp =0.5* sign(move)*50;
		}
		else 
		{
			hsp = 0.5*sign(move)*47;
		
		}
	}
	else
	{
		glidecount += 1;
		vsp = 5;
		if (glidecount < 2*5)
		{
			hsp = 0.5*sign(image_xscale)*100;
		
		}
		else if (glidecount < 2*9)
		{
			hsp = 0.5*sign(image_xscale)*90;
		}
	
		else if (glidecount < 2*13)
		{
			hsp = 0.5*sign(image_xscale)*80;
		
		}
		else if (glidecount < 2*17)
		{
		
			hsp = 0.5*sign(image_xscale)*70;
		}
		else if (glidecount < 2*21)
		{
		
			hsp = 0.5*sign(image_xscale)*60;
		}
		else if (glidecount <2* 25)
		{
		
			hsp =0.5* sign(image_xscale)*50;
		}
		else 
		{
			hsp = 0.5*sign(image_xscale)*47;
		
		}
		
		
	}
	
	
	
	hsp *= 0.7;
	
	
	
	if (key_jump)
	{
		state = states.Playernormal;
		vsp = -jumpstrength;
		oYam.macrostate1 = party1macrostates.followplayer;
		oYam.state = party1states.chase
		oYam.vsp = -25;
		canp1 = 0;
		
		if (instance_exists(oDog))
		{
			oDog.state = dogstates.follow2;
		}
		if (instance_exists(oBroomtrail))
		{
			if (jumpdust == noone)
			{
				jumpdust = instance_create_layer(x,y,"parryspark",oJumpdust);
			
			
			}
		}
	}
	else if (key_p1pressed)
	{
		state = states.Playernormal;
		oYam.macrostate1 = party1macrostates.followplayer;
		oYam.state = party1states.reposition;
		
		canp1 = 0;
		if (instance_exists(oDog))
		{
		oDog.state = dogstates.follow2;
		}
	}
	

	
	
	
	
	if (place_meeting(x+hsp,y+vsp,mobparent))
	{
		
		oYam.macrostate1 = party1macrostates.knockback;
		oDog.state = dogstates.follow2;
		oYam.hsp = -sign(image_xscale)*0.8*knockbackstrength;
		oYam.vsp = -knockupstrength;
		

		
		
	}
	else if (place_meeting(x,y,mobparent))
	{
		
		oYam.macrostate1 = party1macrostates.knockback;
		oDog.state = dogstates.follow2;
		oYam.hsp = -sign(image_xscale)*0.8*knockbackstrength;
		oYam.vsp = -knockupstrength;

		
	}
	else if (mobplus = 1)
	{
		
		oYam.macrostate1 = party1macrostates.knockback;
		oDog.state = dogstates.follow2;
		oYam.hsp = -sign(image_xscale)*0.8*knockbackstrength;
		oYam.vsp = -knockupstrength;
	
	}
	else
	{
		dog.state = dogstates.blank;
		oYam.macrostate1 = party1macrostates.blank;
		oYam.hsp = 0;
		oYam.vsp = 0;
		
	}
	
	with (oMob)
	{
		if (place_meeting(x+hsp,y+hsp,follow))
		{
			follow.mobplus = 1;
			
		}
		else
		{
			follow.mobplus = 0;
			
		}
		
	}
	
	if (place_meeting(x,y+5,oWall))
	{
		state = states.Playernormal;
		rollanim = 1;
		
		oYam.macrostate1 = party1macrostates.followplayer;
		oYam.state = party1states.reposition;
		
	}
	
	
	
	#endregion
	
	onewayending()
	#endregion
	
}
else if (state == states.null)
{
	sprite_index = sPlayer;
	
	
	
	
	
}
else if (state == states.PlayerSwim)
{
	
	wcolor = make_color_hsv(150,100,240);
	move = key_right - key_left;
	vmove = key_down - key_jumphold;
	hsp += move*walksp;
	vsp += vmove*walksp;
	
	hsp *= 0.9;
	vsp *= 0.9;
	x += hsp;
	
	y += vsp;
	
	
	if (!place_meeting(x,bbox_top,oWater))
	{
		state = states.Playernormal;
		vsp = -jumpstrength*0.7;
		
	}
	if (hsp!= 0)
	{
		image_xscale = sign(hsp)*scale;
		
	}
	
	
	
	
}
else if (state = states.PlayerThrow)
{
	throwcount += 1;
	oDog.state = dogstates.blank;
	movement_collision();
	hsp *= movefriction;
	vsp += grv;
	
	
	state = states.Playernormal;
	rollanim = 0;
	landanim = 1;
	
	if (dogthrow = noone)
	{
		dogthrow = instance_create_layer(x+((sign(image_xscale))*0),y-20,"dog",oDogthrow)
	}
	

	
	
	if (instance_exists(oDogthrow))
	{
		if (place_meeting(x,y+2,oWall))
		{
			with (oDogthrow)
			{
				hsp = other.hsp + (sign(image_xscale)*20);
				vsp = -13;
				state = throwstates.groundthrow
				
				
				
			}
			
		
		}
		else
		{
			
			with (oDogthrow)
			{
				
				hsp = other.hsp + (sign(image_xscale)*30);
				vsp = -30;
				state = throwstates.airthrow
				
			}
			
		}
	}
}
else if (state = states.PlayerThrowanim)
{
	
	if (move == 1)
	{
		
		image_xscale = scale*1;
		
		
	}
	else if (move == -1)
	{
		
		image_xscale = scale*-1;
		
	}
	
	
	oDog.x = x;
	oDog.y = y;
	throwcount += 1;
	oDog.state = dogstates.blank;
	movement_collision();
	hsp *= movefriction;
	vsp += grv;
	if (throwcount <2)
	{
		sprite_index = sPlayerThrow;
		image_index = 0;
		
		
	}
	else if (throwcount < 2*3)
	{
		
		sprite_index = sPlayerThrow;
		
	}
	else
	{
		state = states.PlayerThrow;
	}
	
	
	
}
else if (state == states.PlayerDeath)
{
	instance_destroy(oMob);
	
	if (death == noone)
	{
	death = instance_create_layer(x,y,"shadows",oPlayerdeath)
	
	}
	
	

	
	
	
	
	
	
}
else if (state == states.Playeremptynormal)
{
	
	
	
	
	sound_movement();
	
	
	death = noone;
	mybroomtrail = noone;
	throwcount = 0;
	
	onewaystarting();

	

	
	

	#region
	parrycount = 0;
	knockbackcount = 0;

	
	
	if (collision = 0)
	{
		runanim = 0;
		
	}
	
	
	
	#region normal

	image_angle = 0;
	// check if landing
	
	//state change
	
	



	
//////

if (place_meeting(x,y+3,oSlope))
{
	state = states.PlayerSlide;
	
}

if !place_meeting(x,y,oWall) && vsp >= 0 && place_meeting(x,y+2+abs(hsp),oWall) 
{
	while(!place_meeting(x,y+1,oWall)) 
	{
		y += 1;
	}
	
	
}



if (move != 0)
{
	gparryanim = 0;
	
}


if (collision = 0)
{
	gparryanim = 0;
	
}

////////////////////////////////////////oneway




	if ((landanim == 1) or (rollanim == 1) or (crouchanim == 1) or (key_jump)) 
	{
		downjumpbuffer = 0;
		downjumpcount = 0;
	}
	if (downjumpcount = 0)
	{
		downjump = 0;
		
	}
	
	
	if (key_down)
	{
		downjumpbuffer= 1;
			
	}
	

	
	
	
	if (downjumpbuffer = 1)
	{
		downjumpcount += 1;
		
		if (downjumpcount < 10) 
		{
			downjump = 1;
			
			
		}else {
			
			downjump = 0;
		}
		
	}
	
	




	

	

	
	

	

		
	

	
	kbvsp = -knockupstrength;	

	
	



	if (vsp > 0)
	{
		landing = 1;
	}
	else{
		landing = 0;
		}

	if (abs(hsp) > 0)
	{
		hmove = 1;
	}else
	{
		hmove = 0;
	}

	//movement
	if (inputstop != true)
	{
		move = key_right - key_left;
	}
	


	
	hsp += move * walksp;


	hsp *= movefriction;
	/*
	if (place_meeting(x,y+1,oMovingplatform))
	{
		
		x += oMovingplatform.hsp;
		//y = oMovingplatform.y-45;
		y += oMovingplatform.vsp-2;
		if (key_jump)
		{
			vsp = -jumpstrength;
			
		}
		
		
		
		
	}*/
	


	if(abs(hsp) < 1)
	{
		hsp = 0;
	}
	






	vsp = vsp +grv;

	


//collision variable
	if (place_meeting(x,y+vsp,oWall))
	{
		jumpable = 0;
		collision = 1;
	}else {
		collision = 0;
	}

	if (!place_meeting(x,y+1,oWall))
	{
		jumpable += 1;
		
		if (jumpable < 10)
		{
			if (key_jump)
			{
				vsp = -jumpstrength;
				
				
			}
			
		}
		
		
	}
	
	

	if (place_meeting(x,y+1,oWall)) and (key_jump)
	{
		fjumpstartcount = 0;
		
		
		vsp = -jumpstrength;
		
	}

//horizontal collision
#region collision movement





	if (place_meeting(x+hsp,y,oWall))
	{
		yplus = 0;
		while (place_meeting(x+hsp,y-yplus,oWall) and yplus <= abs(2*hsp))
		{
			
			yplus += 1;
			
		}
		
		
		
		if (place_meeting(x+hsp,y-yplus,oWall))
		{
			while (!place_meeting(x+sign(hsp),y,oWall))
			{
				x = x+sign(hsp);
			}

			hsp = 0;
				
				
			
		
			
			
		}
		else
		{
			y -= yplus;
			
		}
		


	
		
	}


	x = x + hsp;

	

	
	if (!place_meeting(x,y,oWall)) and (vsp >= 0) and (place_meeting(x,y+2+abs(hsp),oWall))
	{
		
		while (!place_meeting(x,y+1,oWall))
		{
			y += 1;
			
		}
		
	}
	
	
	
	
	


//vertical collision
	if (place_meeting(x,y+vsp,oWall))
	{
		while (!place_meeting(x,y+sign(vsp),oWall))
		{
			y = y+sign(vsp);  
  		}
		vsp = 0;
	}

     

	y  = y + vsp;



#endregion

//animation

//idle state condition
/*
	if (hsp == 0) and (place_meeting(x+(sign(image_xscale)*2),y,oWall))
	{
		touchx = true;
		
		
	}
	else
	{
		touchx = false;
		
	}*/

	if (hsp == 0) and (!key_left) and (!key_right) 
	{
		
		if (landanim == 0)
		{
			idle = 1;
		}
		else{
			idle = 0;
		}
		
	}
	else {
		idle = 0;
	}




//check for startup aninmation

////////////////////////////////////////////////////////////////////////////

// jumping animation


//parry stuff
#region 


	if (!place_meeting(x,y+1,oWall))
	{
	
	/*image_speed = 0;
	if (sign(vsp) > 0) image_index = 1; else image_index = 0;
	*/
		

		
		
		
#endregion 
		
		if (key_jump)
		{
			parrycount += 1;
		}
		
		if (key_leftreleased) or (key_rightreleased)
		{
			njumpcount = 2*8;
			image_index = 7;
		}
		
		winddownanim = 0;
		landanim = 0;
		rollanim = 0;
		crouchanim = 0;
		crouchriseanim = 0;
		
		
		if (move == 0)
		{
			
			njumpanim = 1;
			
			fjumpstartanim = 0;
			
		}
		
		else {
			fjumpstartanim = 1;
			njumpanim = 0;
			
		}
		
		/////wall grab
		dog = oDog;
		
		if (instance_exists (dog) )
		if (dog.state = dogstates.follow2)
		{
			cangrab = 1;
			
			
		
		}

		
		
		
	
		
		
		
		
		
		
		/////
		
		/*
		if (sign(vsp) < 0)
		{
			riseanim = 1;
		}
		else
		{
			fallstartanim = 1;
		}
		
		*/
	}
	else
	{//not in the air
		
		
		fjumpstartanim = 0;
		
		
		
		/*
		// idle 
		if (idle == 1)//not moving horizontally, movement keys arent pressed
		{
			idleanim = 1;
			runanim = 0;
			
		
		}
		*/
	
	}
	
	if (collision == 1)
	{
		
		parrycount = 0;
		
	}
	
	
	if (idle == 1)
	{
		if (collision == 1)
		{
			idleanim = 1;
			runanim = 0;
			
			
			
			
		}
	}
	else {
		idleanim = 0;
	}
	
	
	if (njumpanim == 1)
	{
		
		
		njumpcount += 1;
		
		
		if (njumpcount < 2)
		{
			sprite_index = sPlayerRise1;
			image_index = 0;
		}
		
		if (njumpcount < njumpframes)
		{
			sprite_index = sPlayerRise1;
			
		}
		else {
			
			sprite_index = sPlayerFall1;
		}
		
	}
	
	
	
	
	
	
	if (place_meeting(x,y+1,oWall))
	{
		grounded = 1;
		
	}
	else
	{
		grounded = 0;	
		
	}

	ds_queue_enqueue(prevframequeue,vsp);

	if (ds_queue_size(prevframequeue)>2)
	{
		prevframegrounded = ds_queue_dequeue(prevframequeue);
		
		
	}


		
	if (grounded == 1) and (abs(hsp) > 10) and (prevframegrounded != 0)
	{
		rollanim = 1;
		
	}
	else if (prevframegrounded != 0) and (grounded == 1) and (move == 0) and (rollset != 1)
	{
		
		landanim = 1;
		
	}
	else if (prevframegrounded != 0) and (grounded == 1) and (abs(move) > 0)
	{
		rollanim = 1;
		
	}
	
	if (runanim == 1) or (winddownanim == 1) or (grounded == 0)
	{
		
		rollset = 0;
		
	}
	
	
	
	
	if (riseanim == 1)
	{
		sprite_index = sPlayerRise1;
	}
	
	if (fallanim == 1)
	{
		sprite_index = sPlayerFall1;
	}
	
	if (fallstartanim == 1) and (rollanim != 1) and (landanim != 1) and (winddownanim != 1) and (grounded != 1)
	{
		fallstartcount += 1;
		if (fallstartcount < 2)
		{
			sprite_index = sPlayerFallStart1;
			image_index = 0;
		}
		else if (fallstartcount < fallstartframes)
		{
			sprite_index = sPlayerFallStart1;
		}
		else {
			sprite_index = sPlayerFall1;
		}
	}
	
	
	// FORWARD JUMPING ANIMATION
	
	
	if (fjumpstartanim == 1) and (rollanim != 1) and (landanim != 1) and (grounded != 1)
	{
		fjumpstartcount += 1;
		if (fjumpstartcount < 2)
		{
			sprite_index = sPlayerFallStart1;
			image_index = 0;
		}
		else if (fjumpstartcount < fjumpstartframes)
		{
			sprite_index = sPlayerFallStart1// FORWARD START ANIM
		}
		else if (fjumpstartcount < (fjumpstartframes + 1)) 
		{
			sprite_index = sPlayerFjump1;//FORWARD LOOPING PLACEHOLDER
			image_index = 0;
		}
		else {
			sprite_index = sPlayerFjump1;
		}
	}
	else {
		
	}
	
	
	
	
	
	if (collision == 1)
	{
		fallstartcount = 0;
		fallstartanim = 0;
		riseanim = 0;
		njumpanim = 0;
		njumpcount = 0;
	}
	
	
	
	

	if (idleanim == 1)
	{
		sprite_index = sPlayer1;
	}

	if (move != 0) and (collision = 1) and (rollanim == 0)
	{
		if (runanim != 1)
		{
			winddownanim = 0;
			startupanim = 1
		}
	
	}
	else {
		startupanim = 0;
	}


	if (runanim == 1) and (collision == 1)
	{
		sprite_index = sPlayerRun1;
	}






	if (startupanim == 1)
	{
		startupcount += 1;
				if(startupcount < 2)
				{
					sprite_index = sPlayerStartup1;
					image_index = 0;
				}
				else if (startupcount < 2*17)
				{
					sprite_index = sPlayerStartup1;
				}
				else {
					runanim = 1;
				}
	}
	else {
		startupcount = 0;
		
		
	}

/*
if (move = 0)
{
	runanim = 0;
	startupcount = 0;
}*/
//winddown


/*
if (keyboard_check_released(vk_left) and (collision = 1)) or (keyboard_check_released(vk_right) and (collision = 1))
{
	winddownanim = 1;
	
}

*/

/*
if (abs(hsp) > 0) and (move = 0) and (collision = 1) and (sprite_index != sPlayerLand)
{
	winddownanim = 1;
	
	
}
*/


	


	if (key_leftreleased) or (key_rightreleased) or (inputrelease == true)
	{
		if (collision == 1) and (rollanim == 0)
		{
			runanim = 0;
			winddownanim = 1;
			startupcount = 0;
			
			winddowncount = 0;
			startupanim = 0;
			crouchcount = 0;
			crouchriseanim = 0;
			crouchanim = 0;
		}
	
	
	}
	
	

	
	
	if (winddownanim == 1) 
	{
		crouchriseanim = 0;
		rollanim = 0;
		startupanim = 0;
		runanim = 0;
		startupcount = 0;
		
		
		
		
		
		
		winddowncount += 1;
		if(winddowncount < 2)
		{
			sprite_index = sPlayerWinddown1;
			image_index = 0;
		
		}
		
		else if (winddowncount < winddownframes)
		{
			sprite_index = sPlayerWinddown1;
			
		}
		
		
	
	
	}
	else {
		winddownanim = 0;
		
		idle = 1;
		
	}

	

	
	
	
//landing
	
	
	if (collision == 1) 
	{
		
		
		
		if (landing == 1)
		{
			
			
			
			idleanim = 0;
			
			if (hmove == 1) and (key_right or key_left) 
			{
				
				
				
				rollanim = 1;
				
			}
			else if (fjumpstartcount > 10)
			{
				rollanim = 1;
				
			}
			else
			{
				landanim = 1;
			}
		
		}
	
	
	}
	
	
	//landing
	if((landanim == 1) and (move == 0))
	{
		
		if (riseanim != 1) or (fallanim != 1)
		{
			
		
		
			fjumpstartanim = 0;
			fallstartanim = 0;
		
			winddownanim = 0;
			hsp = 0;
			landcount += 1;
			if (landcount < 2)
			{
				sprite_index = sPlayerLand1;
				image_index = 0;
			}

			else {
				sprite_index = sPlayerLand1;
			}
		
	
		}
	
	}

	if (landanim == 0)
	{
		landcount = 0;
	}
	
	
	
		if (landanim == 1) 
	{
		winddownanim = 0;
		hsp = 0;
		landcount += 1;
		if (landcount < 2)
		{
			sprite_index = sPlayerLand1;
			image_index = 0;
		}

		else {
			sprite_index = sPlayerLand1;
		}
	
	}

	if (landanim == 0)
	{
		landcount = 0;
	}



	if (rollanim == 1)
	{
		
		//skip startup animation for run
		if (vsp < 0)
		{
			startupanim = 0;
		}
		
		landing = 0;// disable neutral landing animation
		crouchcount = 0;
		crouchriseanim = 0;
		crouchanim = 0;
		fallstartanim = 0;
		fallanim = 0;
		fallstartcount = 0;
		
		if (key_left) or (key_right)
		{
			winddownanim = 0;
			runanim = 1;
			njumpanim = 0;
			
			
			
		}
		if (landanim == 1)
		{
			
			rollanim = 0;
			
		}
		
		
		
		rollcount += 1;
		if (rollcount < 2)
		{
			winddowncount = 0;
			winddownanim = 0;
			sprite_index = sPlayerRoll1;
			image_index = 0;
		}
		else if (rollcount < rollingframes)
		{
			winddowncount = 0;
			winddownanim = 0;
			sprite_index = sPlayerRoll1;
		}
		else {
			rollanim = 0;
			winddownanim = 1;
		}
		
	}


	if (move != 0)
	{
		winddownanim = 0;
	}


	if (hsp != 0 ) 
	{
		image_xscale = sign(hsp)*scale;
	}
//crouching




	

	if (crouchriseanim == 0)
	{
		crouchrisecount = 0;
	}

	if (abs(move) == 1) and (collision == 0)
	{
		landanim = 0;
	}

	if (key_left) or (key_right)
	{
	
	//disable animations while movement keys are down
		landanim = 0;
		crouchriseanim = 0;
	
	}

	if (key_jump)
	{
		runanim = 0;
		crouchriseanim = 0;
		idleanim = 0;
		rollanim = 0;
	}

	if (rollanim == 0)
	{
		rollcount = 0;
	}
	

	
	


	image_speed = 1;
	

	
	
	
	#endregion
	
	

	
	
	
	
	
	onewayending();
	#endregion
	

	
	
}
else if (state == states.Playersleepempty)
{
	
		#region sleep
	
	movement_collision()

	
	move = 0;
	landing = 0;
	landanim = 0;
	
	sleepanim = 1;
	wakeupcount = 0;

	
	if (sleepanim == 1)
	{
		sprite_index = sPlayerSleep1;
	}
	
	
	if (key_action) if (game.cutscene1 == true)
		{
			state = states.Playerwakeupempty;
			with (game)
			{
				beginningsleep = false;
		
			}
		
		
		}
	
	
	
	
	#endregion
}
else if (state == states.Playerwakeupempty)
{
	/*
	if (monologue1 = noone)
	{
		monologue1 = instance_create_layer(x,y,"mob",oMonologue1)
		
		
	}
	*/
	
		#region wakeup
	vsp = 0;
	hsp = 0;
	landanim = 0;
	wakeupcount += 1;
	wakeupsound();
	if (wakeupcount < 2)
	{
		sprite_index = sPlayerWakeup1;
			image_index = 0;
		
		
	}
	else if (wakeupcount < wakeupframes)
	{
		sprite_index = sPlayerWakeup1
	}
	else if (instance_exists(oFlower))
	{
		state = states.Playeremptynormal;
		landanim = 0;
		idleanim = 1;
		with (oFlower)
		{
			instance_destroy();
			
		}
		with (game)
		{
			juststarted = false;
			
			
		}
		
	}
	else
	{
		state = states.Playeremptynormal;
		
	}
	
	
	
	#endregion
	
}
else if (state == states.Playerknockbackempty)
{
	stopsoundmovement();
	
		movement_collision();
	if (instance_exists(oYam))
	{
		if (oYam.macrostate1 = party1macrostates.blank)
		{
			oYam.macrostate1 = party1macrostates.knockback;
		}
		
	}
	if (dogthrow == noone)
	{
		if (instance_exists(oDog))
		{
			oDog.state = dogstates.follow2;
			
			
			
		}
		
		
	}
	#region
	onewaystarting();
	
	image_speed = 1;
	#region knockback
	
	hsp = 0;
	vsp = 0;
	idleanim = 1;
	winddownanim = 0;
	kbvsp = kbvsp +grv;




//collision variable
	if (place_meeting(x,y+kbvsp,oWall))
	{
		collision = 1;
	}else {
		collision = 0;
	}



	

//horizontal collision
	if (place_meeting(x+kbhsp,y,oWall))
	{
	
		while (!place_meeting(x+sign(kbhsp),y,oWall))
		{
			x = x+sign(kbhsp);
		}
	kbhsp = 0;
	}



	x  = x + kbhsp;

	



//vertical collision
	if (place_meeting(x,y+kbvsp,oWall))
	{
		while (!place_meeting(x,y+sign(kbvsp),oWall))
		{
			y = y+sign(kbvsp);  
  		}
		kbvsp = 0;
		
		state = states.Playeremptynormal;
		
		if (rollset == 1)
		{
			rollanim = 1;
		
		}
		else 
		{
			rollanim = 0;
			landanim = 1;
		
		}
		
		
		
	}

     

	y  = y + kbvsp;
	
	if (key_right) or (key_left)
	{
		landanim = 0;
		landing = 0;
		rollset = 1;
		
		
	}
	else
	{
		rollset = 0;
		
	}

	grounded = 0;


	
	
	
	

	
	
	
	////
	
	if ((-(sign(kbhsp)))== 1)
	{
		kbldirection = -1;
		
	}
	else if ((-(sign(kbhsp)))== -1)
	{
		kbldirection = 1;
		
	}
	
	kblhsp = kbldirection*kblandingstrength;

	
	
	#endregion
	crouchanim = 0;
	crouchriseanim = 0;
	knockbackcount += 1;
	if (knockbackcount < 5)
	{
		if (knockbackcount < 2)
		{
			audio_play_sound(hurtsfx,501,false)
			
		}
		sprite_index = sPlayerHurt1;
		image_index = 0;
		
	}
	else if (knockbackcount < 6)
	{
		sprite_index = sPlayerRise1;
		
		image_index = 5;
	}
	else if (knockbackcount <6 + njumpframes - 14)
	{
		sprite_index = sPlayerRise1;
		
	}
	else
	{
		sprite_index = sPlayerFall1;
		
		
	}
	
	
	
	
	
	
	
	onewayending();
	#endregion
	
	
	if (knockbackcount > 6) and (knockbackcount < 8) and (stats.phealth != 1)
	{
		if(iframestate = iframes.inactive)
		{
			stats.phealth -= 1;
			iframestate = iframes.active;
			if(heartshatter == noone)
			{
				heartshatter = instance_create_layer(0,0,"parryspark",oHeartshatter)
			
			
			}
		
		}

		
		
		
		
		
	}
	
}
else if (state == states.chest)
{
	#region
	hsp = 0;
	vsp = 0;
	x = oChest.x;
	y = oChest.y;
	audio_stop_sound(winddownsnd);
	audio_stop_sound(runsnd);
	winddownplaysound = noone;
	runplaysound = noone;
	image_xscale= scale;
	
	sprite_index = sBlank;
	chestcount += 1;
	var chestsecs = 1.6;
	
	if (chestcount > ((151*2) - (chestsecs*60)))
	{
		if(chestmob = noone)
		{
			chestmob = instance_create_layer(x-200,y-500,"mob",oTori);
		}
		
		
	}
	
	
	
	with (oChest)
	{
		count += 1;
		
		if (count < 2)
		{
			sprite_index = sShovelpull
			image_index = 0;
			
		}
		else if (count < image_number*2)
		{
			sprite_index = sShovelpull
			
		}
		else
		{
			with (game)
			{
				
		
			}
			
		}
		
		if (image_index = 1)
		{
			audio_play_sound(pullsfx,501,false)
			
		}
		if (image_index = 26)
		{
			audio_play_sound(shovelpullsfx,501,false)
			ScreenShake(10,60)
			
		}
		
		if (image_index = 31)
		{
			audio_sound_pitch(runningsfx,random_range(0.5,1.5))
			audio_play_sound(runningsfx,501,false)
			
			
			
		}
		
		if (image_index = 39)
		{
			
			audio_sound_pitch(runningsfx,random_range(0.5,1.5))
			audio_play_sound(runningsfx,501,false)
			
		}
		
		
		if (image_index = 69)
		{
			
			audio_sound_pitch(wakeupsfx,random_range(0.5,1.5))
			audio_play_sound(wakeupsfx,501,false)
			
		}
		if (image_index = 74)
		{
			
			audio_sound_pitch(runningsfx,random_range(0.5,1.5))
			audio_play_sound(runningsfx,501,false)
			
		}
		
		if (image_index = 91)
		{
			audio_sound_gain(wakeupsfx,0.5,0)
			audio_sound_pitch(wakeupsfx,random_range(0.5,1.5))
			audio_play_sound(wakeupsfx,501,false)
			
		}
		if (image_index = 113)
		{
			audio_sound_gain(wakeupsfx,1,0)
			audio_sound_pitch(wakeupsfx,random_range(0.5,1.5))
			audio_play_sound(wakeupsfx,501,false)
			
		}
		
		/*
		if (image_index = 46)
		{
			audio_sound_pitch(shovelpullsfx1,choose(0.5,1,1.5))
			audio_play_sound(shovelpullsfx1,501,false)
			audio_sound_gain(shovelpullsfx1,1,0)
			
			
			
		}
		
		if (image_index = 48)
		{
			audio_sound_pitch(shovelpullsfx1,choose(0.7,1.1,1.4))
			audio_play_sound(shovelpullsfx1,501,false)
			audio_sound_gain(shovelpullsfx1,0.5,0)
			
			
			
		}*/
		
		
	}
	with (chestmob)
	{
		if(place_meeting(x+hsp,y+vsp,other))
		{
			
			
			with (oChest)
			{
				instance_destroy();
				with (game)
				{
					juststarted = false;
				}
			}
			
			
			mobstate = mobstates.freezeempty;
			other.state = states.emptyparry;
			

			var parrypositionx = (follow.x + x)/2;
			var parrypositiony = (follow.y + y)/2;
			parriedspark = instance_create_layer(parrypositionx,parrypositiony,"parryspark",oParryspark1);
			
			// (parried == 1) and (mobstate == mobstates.freeze) and (freezecount < 1)
		}
		
		
	}
	
	#endregion
	
}
else if (state == states.emptyparry)
{
	#region
	image_xscale = scale;
	if (instance_exists(oDog))
	{
		oDog.bumpoffcount = 0;
		
	}
	
	if (parrycount < 2)
	{
		ScreenShake(parrymagnitude,30)
		
	}
	
	parrycount += 1;
	if (parrycount > 12)
	{
		/*
		if (monologue2 = noone)
		{
			monologue2 = instance_create_layer(x,y,"mob",oMonologue2)
			
		}*/
		state = states.Playernormal;
		instance_create_layer(x,y,"parryspark",checkpoint);
		iframestate = iframes.activep;
		stats.shovel = 1;
		instance_create_depth(stats.xstart +70,stats.ystart +55,-16000,obuttonshovelfx)
		
		
		
	}
	if (collision = 0)
	{
		sprite_index = sPlayerParry;
		hsp = sign(image_xscale)*40;
		vsp = -1.2*jumpstrength;
		
	}
	
	else 
	{
		
		sprite_index = sPlayerGParry;
		image_index = 0;
	
		landanim = 1;
		
		
	}
	
	
	
	
	
	#endregion
	
	
	
	
} 
else if (state == states.wallslide)
{
	
	wallslidecount += 1;
	movement_collision();
	move = key_right-key_left;
	
	
	hsp = 0;
	
	
	vsp = 5
	var instwall = instance_place(x+(-3*sign(image_xscale)),y,wallvert);
	if (instwall != noone)
	{
		var dirwall = point_direction(x,y,instwall.x,instwall.y);
	
		if (dirwall > 90 < 270)
		{
			image_xscale = -1*scale;
		
		}
		else
		{
			image_xscale = scale
		
		}
	}
	else
	{
		state = states.Playernormal;
		
	}
	
	
		normalcount = 0;

	

	if (key_jump)
	{
		state = states.Playernormal;
		vsp = -jumpstrength;
	}
	
	
	
	
	if (wallslidecount < 2)
	{
		sprite_index = sPlayerWallSlide;
		image_index = 0;
		
		
	}
	else if (wallslidecount < 2*image_number)
	{
		
		sprite_index = sPlayerWallSlide;
	}
	else
	{
		
		sprite_index = sPlayerWallSlide;
		image_index = 17;
	}
	
	
	
}
else if (state == states.stuck)
{
	hsp = 0;
	vsp = 0;
	if (instance_exists(oDog))
	{
		oDog.state = dogstates.blank;
		
	}
	movement_collision();
	stuckcount += 1;
	airtime = 0;
	hsp = 0;
	rollanim = 0;
	move = 0;
	rollset = 0;
	runanim = 0;
	idleanim = 1;
	
	vsp += grv;
	
	if (stuckcount < 2)
	{
		ScreenShake(20,60)
		audio_play_sound(hurtsfx,501,false)
		
		sprite_index = sPlayerStuck;
		image_index = 0
	}
	else if (stuckcount < (2*(image_number))-1)
	{
		
		sprite_index = sPlayerStuck;
	}
	else
	{
		sprite_index = sPlayerStuck;
		image_index = image_number - 1;
		
		
		if (key_action)
		{
			state = states.stuckgetup;
			
		}
		
	}
	
	
}
else if (state == states.stuckgetup)
{
	movement_collision();
	stuckgetupcount += 1;
	
	vsp += grv;
	
	if (stuckgetupcount < 2)
	{
		sprite_index = sPlayerStuckgetup;
		image_index = 0
		
	}
	else if (stuckgetupcount < (2*(image_number))-1)
	{
		
		sprite_index = sPlayerStuckgetup;
		
	}
	else
	{
		state = states.Playernormal;
		if (instance_exists(oDog))
		{
			oDog.state = dogstates.follow2;
			instance_create_layer(x,y,"parryspark",oTpspark);
			
		}
		rollanim = 0;
		landanim = 1;
		
		
	}
	if (image_index = 1)
	{
		audio_sound_pitch(wakeupsfx,random_range(0.5,1.5))
		audio_play_sound(wakeupsfx,501,false)
		
	}
	if (image_index = 30)
	{
		audio_play_sound(runningsfx,501,false)
		ScreenShake(3,30);
		
	}
	
	
}
else if (state == states.toripull )
{
	
	sprite_index = sBlank;
	landanim = 1;
	hsp = 0;
	
}
else if (state == states.Carry)
{
	carrycount++;
	airtime = 0;
	
	if (carrycount = 1)
	{
		jumpdust = instance_create_layer(x+sign(image_xscale)*50,y,"parryspark",oJumpdust);
		
	}
	/*
	if (instance_exists(jumpdust))
	{
		jumpdust.x = x+sign(image_xscale)*50;
		jumpdust.y = y;
	}*/
	canp2 = 0;
	sprite_index = sBarryCarry;
	movement_collision();
	vsp += grv/3;
	hsp*=movefriction;
	
	if (place_meeting(x,y+2,oWall))
	{
		state = states.Playernormal;
		oDog.state = dogstates.follow2;
		oBarry1.state = party1states.chase;
		oBarry1.macrostate1 = party1macrostates.followplayer;
	}
	oBarry1.x = x;
	oBarry1.y = y;
	oBarry1.queuex = x;
	oBarry1.queuey = y;
	oBarry1.hsp = 0;
	oBarry1.vsp = 0;
	oDog.queuex = x;
	oDog.queuey = y;
	
	
	if (key_jump)
	{
		vsp = -40;
		state = states.Playernormal;
		oDog.state = dogstates.follow2;
		oBarry1.state = party1states.chase;
		oBarry1.macrostate1 = party1macrostates.followplayer;
		
	}
	
	if (key_p2pressed)
	{
		state = states.Playernormal;
		oDog.state = dogstates.follow2;
		oBarry1.state = party1states.chase;
		oBarry1.macrostate1 = party1macrostates.followplayer;
		
	}
	
	
	if (instance_exists(oDog))
	{
		oDog.state = dogstates.blank;
		
	}
	
	
	
}

