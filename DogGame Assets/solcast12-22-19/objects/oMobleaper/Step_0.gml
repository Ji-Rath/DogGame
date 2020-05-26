if (mobnstate != mobnestedstates.aggro)
{
	attackcount = 0;
	
	
}
FollowBranch = noone;


onewaystarting();
//Player input
	#region input
	bind_right = vk_right;
	bind_left = vk_left;
	bind_down = vk_down;
	bind_jump = vk_space;
	bind_action = vk_up;
	 
	key_left = keyboard_check(bind_left);
	key_left_pressed = keyboard_check_pressed(bind_left)
	key_right_pressed = keyboard_check_pressed(bind_right)
	key_right = keyboard_check(bind_right);
	key_jump = keyboard_check_pressed(bind_jump);
	key_down = keyboard_check(bind_down);
	key_downreleased = keyboard_check_released(bind_down);
	key_leftreleased = keyboard_check_released(bind_left);
	key_rightreleased = keyboard_check_released(bind_right);
	key_action = keyboard_check(bind_action);
	key_actionreleased = keyboard_check_released(bind_action);

	reset = keyboard_check(vk_alt);
	
	if (reset)
	{
		game_restart();
	}
	
	#endregion
	
	
	
#region detectrange
	
	var distance = point_distance(x,y,follow.x,follow.y);
	
     
	if (distance < detectrange)
	{
		
		mobnstate = mobnestedstates.aggro;
			
	}
	
	
	if (place_meeting(x,y,oPlayer))
	{
		
		mobstate = mobstates.mobknockback;
	}
	
	attackrange = 300;
	
	
	
	
	
	
#endregion


#region parry
if (place_meeting (x+hsp,y,oParry))
{
	parrycollide = 1;
	
}
else {
	
	parrycollide = 0;
}



if (parrycollide = 1) and (oParry.state == parrystates.active) 
{
	mobstate = mobstates.freeze;
	follow.state = states.Playerparry;
	
	parried = 1;
	
	

		
}
else
{
	
	parried = 0;
	
}
	
	var parrypositionx = (follow.x + x)/2;
	var parrypositiony = (follow.y + y)/2;
	
	
	
	
if (parried == 1) and (mobstate == mobstates.freeze) and (freezecount < 1)
{
	
	instance_create_layer(parrypositionx,parrypositiony,"parryspark",oParryspark);
	if(instance_exists(oParryspark))
	{
		with (oParryspark)
		{
			image_angle = random(360);
			
		}
		
		
	}
	
	
	
	
}
	
	#endregion
	






// STATES
if(mobstate ==	mobstates.mobattack)
{
	
	
	
	
	#region normal
	
	
	
	#region base stuff
	
	mobknockbackcount = 0;
	
	hsp *= movefriction;


	//movement

	
	movement_collision();
	
	
	
	
	#endregion

	pausecount = 0;


	
//////////////////////////////////////////////////////////////////	
///////////////////////////////////////////////////////////////////	
//////////////////////////////////////////////////////////////////////////////////////
//nested state machine
	if (mobnstate == mobnestedstates.waiting)
	{
		#region
		
		detectrange = 400;
		searchingcount = 0;
		
		
		hsp = 0;
		vsp += grv;
		
		

		

		#endregion
	}
	else if (mobnstate == mobnestedstates.aggro)
	{
		#region
		
		#region knockback detection
		
		with (follow)
		{
			
			
			
			if (place_meeting(x+hsp,y+vsp,oMob)) 
			{
				image_xscale = scale*-sign(other.image_xscale);
				state = states.PlayerKnockback;
				if (state = states.PlayerGlide)
				{
					oYam.macrostate1 = party1macrostates.followplayer;
					oYam.state = party1states.reposition;
					
					dog.state = follow2;
					
					
				}
				if (other.mobknockbackcount < 2)
				{
					kbhsp = (sign(other.image_xscale)*knockbackstrength)
				
				
				}
			}
			
			
		}
		#endregion
		attackcount += 1;
		
		
		if (attackcount < 2)
		{
			vsp = -40;
			
			playerdir = follow.x - x;
			
		}
		
		if (place_meeting(x,y+1,oWall)) and (attackcount > 2)
		{
			mobnstate = mobnestedstates.waiting;
			
			
		}
		
		hsp = sign(playerdir)*30;
		
		searchingcount = 0;
		
		
		grv = 4;
		vsp += grv;
		if (distance > detectrange)
		{
			mobstate = mobstates.mobreturn;
		}
		else
		{
			mobstate = mobstates.mobattack;
			
		}
		

		if (hsp != 0)
		{
		image_xscale = scale*sign(hsp);
		}
		
	
	
		
		
		
		
		#endregion
		

	}
	else if (mobnstate == mobnestedstates.searching)
	{
		
		
		
		#region
		
		
		
		if (hsp != 0)
		{
		image_xscale = scale*sign(hsp);
		}
		grv = 0;
		
		detectrange = 500;
		
		angle += 0.2;	
		
		
		angle2 += 0;
		
		searchingcount += 1;
		
		
		var dir = point_direction (x,y,follow.x, follow.y);
		
		hsp = sign((lengthdir_x(chasesp, dir)))*(sin(angle2) * (length + 10)); 
		vsp = sin(angle) * length;
		
		
		if (searchingcount > 60)
		{
			mobstate = mobstates.mobreturn;
			
		}
		
		
		
		
		
		
		
		#endregion
		
		
		
		
		
		
	}
	else if (mobnstate == mobnestedstates.returning)
	{
		#region
		
		mobnstate = mobnestedstates.waiting;
		
		
		#endregion
		
	}
	else if (mobnstate == mobnestedstates.mknockback)
	{
		#region
		
		#endregion
	

	
		
		
	}

	

	
	
	
	
	
	#endregion
		
} else if (mobstate == mobstates.mobknockback)
{
	freezecount = 0;

	
	
	#region
	
	
	grv = 4;
	mobknockbackcount += 1;
	movement_collision();	
	vsp += grv;
	
	if (place_meeting(x,y+2,oWall))
	{
		mobstate = mobstates.mobattack;
		
	}else 
	{	
		if(mobknockbackcount < 2)
		{
			hsp = -(sign(image_xscale) * knockbackstr)
			vsp = -2*knockbackstr;
			
			
		}
		
		hsp *= 0.9;
		
	}
	
	
	
	

	
	


	#endregion
	
	
	
	
	
	
} else if (mobstate == mobstates.mobreturn)

{
	#region
	
	mobknockbackcount = 0;
	movement_collision();
	
	mobstate = mobstates.mobattack;
	
	
	
	if (distance < detectrange)
	{
		
		mobstate = mobstates.mobattack;
			
	}
	
	

	
	
	
	
	
	
	
	#endregion
	
	
	
	
	
} else if (mobstate == mobstates.mobtest)
{
	
} else if (mobstate == mobstates.pause)
{
	#region
	
	

	pausecount += 1;
	
	if (pausecount > 20)
	{
		
		mobstate = mobstates.mobattack;
		
		
	}
	
	
	#endregion
	
} else if (mobstate == mobstates.freeze)
{
	#region
	
	

	freezecount += 1;
	
	if (freezecount > 3)
	{
		
		
		
		if (follow.collision = 0)
		{
			
			mobstate = mobstates.mobknockback2;

		
			vsp = 20;
		
			knockupstrength = -500;
		
		}
		else
		{
			
			knockupstrength = 500;
			mobstate = mobstates.mobknockback;
		}
	
		
		
	}
	
	
	#endregion
	
}else if (mobstate == mobstates.mobknockback2)
{
	freezecount = 0;

	
	
	#region
	
	
	grv = 3;
	mobknockbackcount += 1;
	movement();	
	vsp += grv;
	if (collision = 1)
	{
		hsp = 0;
		vsp = 0;
		
	}else if (mobknockbackcount < 15) 
	{	
		if(mobknockbackcount < 2)
		{
			hsp = -(sign(image_xscale) * knockbackstr)
			vsp = knockbackstr;
			
			
		}
		
		hsp *= 0.9;
		
	}
	
	
	
	
	if (mobknockbackcount > 15)
	{
		mobstate = mobstates.mobattack;
		
	}
	
	


	#endregion
	
}
