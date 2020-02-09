/// @description Insert description here
// You can write your code in this editor

//Turn invisible when in battle
visible = !(room == battle);

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


//Point sprite in right/left direction
if (hsp != 0)
{
	image_xscale = sign(hsp)*scale;

}



//Animations


//Change to walk up/down if moving vertically
if (vmove > 0)
{
	sprite_index = spritedownwalk;
	
	//Sprinting Anim
	if(key_baction)
	{
		sprite_index = spritedownrun;
	}
			
} else if (vmove < 0)
{
	sprite_index = spriteupwalk;
	
	//Sprinting Anim
	if(key_baction)
	{
		sprite_index = spriteuprun;
	}
}

//Change to walk right/left if moving horizonally
if (hmove != 0)
{
	sprite_index = hspritewalk;
	
	//Sprinting Anim
	if(key_baction)
	{
		sprite_index = hspriterun;
	}
}

//Animate sprite if moving
if(hsp != 0 || vsp != 0) {
	image_speed = 1;
} else {
	image_speed = 0;
	image_index = 4; //The only position in every sprite where the player is idle
	
	//Switch to idle when standing still
	if(sprite_index == hspriterun)
	{
		sprite_index = hspritewalk;
	}
	if(sprite_index == spriteuprun)
	{
		sprite_index = spriteupwalk;
	}
	if(sprite_index == spritedownrun)
	{
		sprite_index = spritedownwalk;
	}
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
	vmove = key_down - key_up;
	hsp = hmove*walkspd;
	vsp = vmove*walkspd;
	
	movement_collision();
}


radius = 50;

//For a future NPC interaction, maybe, wait what is going on now. 
KeyInteract = keyboard_check_pressed(bind_action);
if (KeyInteract)
{
	var inst = collision_rectangle(x-radius,y-radius,x+radius,y+radius,oNPCParent,false,false);
	if(inst != noone)
	{
		//If player is currently not in dialogue
		if(!inst.TextCooldown)
		{
			if (inst != noone)
			{
				create_textbox(inst.Text,inst.id);
			}
		}
		if(!instance_exists(obj_textbox))
		{
			inst.TextCooldown = false;
		}
	}
}