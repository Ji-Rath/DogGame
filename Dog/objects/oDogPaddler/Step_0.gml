/// @description Insert description here
// You can write your code in this editor

//Turn invisible when in battle
visible = !(room == rmBattle);

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

//Animate sprite if moving
if(HSpeed != 0 || VSpeed != 0) {
	image_speed = 1;
} else {
	image_speed = 0;
	image_index = 4; //The only position in every sprite where the player is idle
	
	//Switch to idle when standing still
	if(sprite_index == SRun)
	{
		sprite_index = SWalk;
	}
	if(sprite_index == SRunUp)
	{
		sprite_index = SWalkUp;
	}
	if(sprite_index == SRunDown)
	{
		sprite_index = SWalkDown;
	}
}







//Set speed and animation while walking/running
if (key_baction)
{
	WalkSpd = 8;
	scrRun()
}
else
{
	WalkSpd = 3;
	scrWalk()
}


//If player is in the normal state, update movement variables
if (state = paddlerstates.normal)
{
	
	hmove = key_right - key_left;
	vmove = key_down - key_up;
	HSpeed = hmove*WalkSpd;
	VSpeed = vmove*WalkSpd;
	
	scrMoveCollision();
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
				scrCreateTextBox(inst.Text,inst.id);
			}
		}
		//System to prevent textbox from showing up unintentionally
		if(!instance_exists(oTextBox))
		{
			inst.TextCooldown = false;
		}
	}
}