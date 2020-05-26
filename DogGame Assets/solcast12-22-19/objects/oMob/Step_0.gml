/*
if (rightmirage = noone)
{
	rightmirage = instance_create_layer(x+rightoffset,y,"mob",mobmirage);
	rightmirage.parent = id;
}

if (leftmirage = noone)
{
	leftmirage = instance_create_layer(x+leftoffset,y,"mob",mobmirage);
	leftmirage.parent = id;
	
	
}*/
	
	if (hsp != 0)
	{
		image_xscale = scale*sign(hsp);
	}

if (FollowBranch = noone)
{
	FollowBranch = instance_create_layer(xstart,ystart,"marker",oBranch)
	
	
}


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
	
	

	
	attackrange = 300;
	
	
	
	
	
	
#endregion
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
else if (place_meeting(x,y,oStar))
{
	mobstate = mobstates.freeze;
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
	
	parriedspark = instance_create_layer(parrypositionx,parrypositiony,"parryspark",oParryspark);
	
	if(instance_exists(oParryspark))
	{
		with (oParryspark)
		{
			image_angle = random(360);
			
		}
		
		
	}
	
	
	
	
}
	
	

/*
if (follow.groundparry == 1) and (parrycollide == 1)
{
	if (mobknockbackcount < 2)
	{
		vsp = 0;
		hsp = 0;
					
		follow.vsp = 0;
		follow.hsp = 0;
	}
	else if (oMob.mobknockbackcount < 5)
	{
					
			
					
					
		vsp = -40;
		hsp = -(sign(image_xscale)*30)
					
	}
			
	
	
}*/




// STATES
if(mobstate ==	mobstates.mobattack)
{
	#region normal
	
	
	
	kbstrength = 30;
	kustrength = 30;
	
	if (place_meeting(x,y,oPlayer)) 
	{
		
		mobstate = mobstates.mobknockback;
	}
	
	#region base stuff
	
	mobknockbackcount = 0;
	
	hsp *= movefriction;


	//movement

	
	movement();
	
	
	
	
	#endregion

	pausecount = 0;


	
//////////////////////////////////////////////////////////////////	
///////////////////////////////////////////////////////////////////	
//////////////////////////////////////////////////////////////////////////////////////
//nested state machine
	if (mobnstate == mobnestedstates.waiting)
	{
		#region
		
		detectrange = 700;
		searchingcount = 0;
		
		
		hsp = 0;
		vsp = 0;
		
		
		x = FollowBranch.x;
		y = FollowBranch.y;
		

		#endregion
		image_xscale = scale*(sign(follow.x-x))
		startcount = 0;
		if (returnanimstate == 1)
		{
			returncount += 1
			
			if (returncount < 2)
			{
				sprite_index = returnanim;
				image_index = 0;
				
				
			}
			else if (returncount < 2*(image_number-1))
			{
				
				sprite_index = returnanim;
				
				
			}
			else
			{
				returnanimstate = 0;
				
			}
		}
		else
		{
			
			sprite_index = idleanim;
			
		}
		
		
	}
	else if (mobnstate == mobnestedstates.aggro)
	{
		#region
		

		with (follow)
		{
			
			
			
			if (place_meeting(x+hsp,y+vsp,oMob)) and (oPlayer.iframestate != iframes.active) and (game.juststarted == true) and (oPlayer.state != states.chest)and (oPlayer.iframestate != iframes.activep)
			{
				image_xscale = scale*-sign(other.image_xscale);
				state = states.Playerknockbackempty;
				
				if (other.mobknockbackcount < 2)
				{
					kbhsp = (sign(other.image_xscale)*knockbackstrength)
				
				
				}
			}
			else if (place_meeting(x+hsp,y+vsp,oMob))and (oPlayer.iframestate != iframes.activep) and (oPlayer.iframestate != iframes.active) and (oPlayer.state != states.chest) and (other.mobstate != mobstates.mobknockback)
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
		
		
		searchingcount = 0;
		angle = 0;
		angle2 = 0;
		
		grv = 0;
		if (distance > detectrange)
		{
			mobstate = mobstates.mobreturn;
		}
		else
		{
			mobstate = mobstates.mobattack;
			
		}
		
		
		var dir = point_direction (x,y,follow.x, follow.y);
		hsp += (lengthdir_x(chasesp, dir))*aggroacc;
		vsp += (lengthdir_y(chasesp, dir))*aggroacc;
		
		/*
		
		var dirx = oPlayer.x - x;
		var diry = oPlayer.y - y;
		
		var limit = 10;
		if (hsp < limit)
		{
			hsp += sign(dirx)*walksp
			hsp *= movefriction;
		
		}
		else
		{
			hsp = limit;
			
		}
		
		
		
		if (vsp < limit)
		{
			vsp += sign(diry)*walksp
			vsp *= movefriction;
		}
		else
		{
			vsp = limit;
			
		}
		
		
		if (hsp != 0)
		{
		image_xscale = sign(hsp)*scale;
		}
		*/
		
		/*
		aggroacc = .3;
		*/
		if (distance < attackrange)
		{
			aggroacc = .4;
			
			
		}
		else {
			aggroacc = 0.10;
			
		}
		
		
		
		
		#endregion
		
		startcount += 1;
	
		if(startcount < 2)
		{
			sprite_index = startupanim;
			image_index = 0;
		
		
		
		}
		else if (startcount < 2*(image_number-1))
		{
		
			sprite_index = startupanim;
		
		
		}
		else
		{
			sprite_index = flyanim;
		
		
		
		}
	
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
		
		if (FollowBranch.occupied = 0)
		{
			if (hsp != 0)
			{
			image_xscale = scale*sign(hsp);
			}
		
			var dirbranch = point_direction (x,y,FollowBranch.x, FollowBranch.y);
			hsp = (lengthdir_x(returningsp, dirbranch));
			vsp = (lengthdir_y(returningsp, dirbranch));
		
			if (x == FollowBranch.x) and (y == FollowBranch.y)
			{
			
				mobnstate = mobnestedstates.waiting;
			
			}
		
		}
		
		
		#endregion
		
		sprite_index = flyanim;
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

	sprite_index = knockbackanim;
	
	#region
	
	
	grv = 1;
	mobknockbackcount += 1;
	movement();	
	vsp += grv;
	if (collision = 1)
	{
		hsp = 0;
		vsp = 0;
		
	}else if (mobknockbackcount < 2*15) 
	{	
		if(mobknockbackcount < 2)
		{
			hsp = (sign(oPlayer.image_xscale) * kbstrength)
			vsp = -kustrength;
			
			
		}
		
		hsp *= 0.9;
		
		
		feather();
		
		
	}
	
	
	
	
	if (mobknockbackcount > 2*15)
	{
		mobstate = mobstates.mobattack;
		
	}
	
	


	#endregion
	
	
	
	
	
	
} else if (mobstate == mobstates.mobreturn)

{
	sprite_index = flyanim;
	returncount = 0;
	returnanimstate = 1;
	#region
	
	mobknockbackcount = 0;
	movement();
	
	if (hsp != 0)
	{
		image_xscale = scale*sign(hsp);
	}
		
	var dirbranch = point_direction (x,y,FollowBranch.x, FollowBranch.y);
	hsp += (lengthdir_x(returningsp, dirbranch));
	vsp += (lengthdir_y(returningsp, dirbranch));
	
	hsp *= movefriction;
	vsp *= movefriction;
	
	
	var branchrange = point_distance(x,y,FollowBranch.x,FollowBranch.y);
	if (branchrange < 10)
	{
		mobstate = mobstates.mobattack;
		mobnstate = mobnestedstates.waiting;
		
	}
	
	
	
	if (distance < detectrange)
	{
		
		mobstate = mobstates.mobattack;
			
	}
	
	/*
	if (instance_exists(follow))
	{
		xTobranch = FollowBranch.x;
		yTobranch = FollowBranch.y;
	}

	//update object position
	x += (xTobranch - x) / 10;
	y += (yTobranch - y) / 10;
		
		
	
			
	if (((xTobranch-x)/10) < 0.01) and (((yTobranch-y)/10) < 0.01)
	{
		
		mobstate = mobstates.mobattack;
		mobnstate = mobnestedstates.waiting;
		
			
	}*/
	

	
	
	
	
	
	
	
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
	
	sprite_index = impactanim;
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
	sprite_index = flyanim;
	
	
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
			vsp = 20;
			
			
		}
		
		hsp *= 0.9;
		feather();
	}
	
	
	
	
	if (mobknockbackcount > 15)
	{
		mobstate = mobstates.mobattack;
		
	}
	
	


	#endregion
	
}else if (mobstate == mobstates.freezeempty)
{
	
	sprite_index = impactanim;
	#region
	
	

	freezecount += 1;
	
	if (freezecount > 12)
	{
		mobstate = mobstates.kbempty;
		knockupstrength = 500;
		
	}
	
	
	#endregion
	
} else if (mobstate == mobstates.kbempty)
{
	freezecount = 0;

	sprite_index = knockbackanim;
	
	#region
	
	
	grv = 1;
	mobknockbackcount += 1;
	movement();	
	vsp += grv;
	if (collision = 1)
	{
		hsp = 0;
		vsp = 0;
		
	}else if (mobknockbackcount < 2*15) 
	{	
		if(mobknockbackcount < 2)
		{
			hsp = -(sign(image_xscale) * 50)
			vsp = -27;
			
			
		}
		
		hsp *= 0.9;
		feather();
		
		
		
		
	}
		
	
	
	
	
	if (mobknockbackcount > 2*15)
	{
		with(oPlayer)
		{
			instance_destroy(chestmob);
			
		}
		
	}
	
	


	#endregion
	
	
	
	
	
	
} 
