/// @description Insert description here
// You can write your code in this editor


/*
if(instance_exists(obj_textbox))
{
	if (sprite_index = hspritewalk) or (sprite_index = hspriterun)
	{
		sprite_index = hsprite;
		
	}
	else if (sprite_index = spriteupwalk) or (sprite_index = spriteuprun)
	{
		sprite_index = spriteup;
		
	}
	else if (sprite_index = spritedownwalk) or (sprite_index = spritedownrun)
	{
		sprite_index = spritedown;
		
	}
	
	exit;	
	
}
*/

//Remove player if in battle room
/*
if (room = battle)
{
	instance_destroy();
	BattleManager.enemy = attacker;
	BattleManager.actioninput = bind_action;
	
}
*/

/*
if (instance_exists(oFade))
{
	exit;
	
}
*/

//If enemy collides with player, go to battle scene
if (place_meeting(x,y,oEnemy))
{
	//var enemyplace = instance_place(x,y,oEnemy);
	
	
	//Go to battle scene if enemy is alert
	if (oEnemy.state == estates.aggro) or (oEnemy.state == estates.alert)
	{
		if (battlewarp = noone)
		{
			battlewarp = instance_create_layer(x,y,"effects",oWarp);
			battlewarp.target = battle;
			battlewarp.warpcolor = c_red;
		}
		
	}
	/*
	else
	{
		if (battlewarp = noone)
		{
			battlewarp = instance_create_layer(x,y,"effects",oWarp);
			battlewarp.target = battle;
			battlewarp.warpcolor = c_aqua;
		}
		
	}
	*/
	
}

//Boolean variables to see if a key is pressed
key_left = keyboard_check(bind_left);
key_leftreleased = keyboard_check_released(bind_left);

key_right = keyboard_check(bind_right);
key_rightreleased = keyboard_check_released(bind_right);

key_down = keyboard_check(bind_down);
key_downreleased = keyboard_check_released(bind_down);

key_up = keyboard_check(bind_up);
key_upreleased = keyboard_check_released(bind_up);

key_action = keyboard_check_pressed(bind_action);
key_baction = keyboard_check(bind_baction);




/*
if (hsp != 0)
{
	hmoving = true
}
else
{
	hmoving = false
}
if (vsp != 0)
{
	vmoving = true;
}
else
{
	vmoving = false
}
*/

//Point sprite in right/left direction
if (hsp != 0)
{
	image_xscale = sign(hsp)*scale;

}



//Animations

/*
if ((key_leftreleased) or (key_rightreleased)) and (vmove = 0)
{
	sprite_index = hsprite;
	
}
else if (key_upreleased)  and (hmove = 0)
{
	sprite_index = spriteup;
}
else if (key_downreleased) and (hmove = 0)
{
	sprite_index = spritedown;
}
else if (key_baction) and (hmoving = true)
{
	sprite_index = hspriterun;
		
}
else if (hmove != 0)
{
	sprite_index = hspritewalk
		
}
else if (key_baction) and (vmoving = true) and (vmove < 0)
{
	sprite_index = spriteuprun;
}
else if (vmove < 0)
{
	sprite_index = spriteupwalk;
			
}
else if (key_baction) and (vmoving = true)
{
	sprite_index = spritedownrun;
}
else if (vmove > 0)
{
	sprite_index = spritedownwalk;
			
}
*/


//Change to walk up/down if moving vertically
if (vmove > 0)
{
	sprite_index = spritedownwalk;
	
	//Sprinting Anim
	if(key_baction)
	{
		sprite_index = spritedownrun
	}
			
} else if (vmove < 0)
{
	sprite_index = spriteupwalk;
	
	//Sprinting Anim
	if(key_baction)
	{
		sprite_index = spriteuprun
	}
}

//Change to walk right/left if moving horizonally
if (hmove != 0)
{
	sprite_index = hspritewalk
	
	//Sprinting Anim
	if(key_baction)
	{
		sprite_index = hspriterun
	}
		
}

//Animate sprite if moving
if(hsp != 0 || vsp != 0) {
	image_speed = 1;
} else {
	image_speed = 0;
	image_index = 4; //The only position in every sprite where the player is idle
}







//Sprint button makes player walk faster
if (key_baction)
{
	walkspd = 8; 
}
else
{
	walkspd = 3;
}


//If player is in the normal state, update movement variables
if (state = paddlerstates.normal)
{
	
	hmove = key_right - key_left;
	vmove = key_down-key_up;
	hsp = hmove*walkspd;
	vsp = vmove*walkspd;
	
	movement_collision();
	
	
	
}


radius = 50;

//For a future NPC interaction, maybe, wait what is going on now. 
input_interact = keyboard_check_pressed(bind_action);
if (input_interact)
{
	var inst = collision_rectangle(x-radius,y-radius,x+radius,y+radius,npc,false,false);
	
	if (inst!= noone)
	{
		with (inst)
		{
			create_textbox(text,id)
		}
	}
	
	
}