/// @description Insert description here
// You can write your code in this editor

//Turn invisible when in battle
visible = !(room == rmBattle);

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

//Set depth
depth = -y;





//Set speed and animation while walking/running
if (global.KeySprint)
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
	var HMove = global.KeyRight - global.KeyLeft;
	var VMove = global.KeyDown - global.KeyUp;
	HSpeed = HMove*WalkSpd;
	VSpeed = VMove*WalkSpd;
	
	scrMoveCollision();
}


radius = 50;

//For a future NPC interaction, maybe, wait what is going on now. 
if (global.KeyInteract)
{
	var inst = collision_rectangle(x-radius,y-radius,x+radius,y+radius,oNPCParent,false,false);
	if(inst != noone)
	{
		//If player is currently not in dialogue
		if(!inst.TextCooldown)
		{
			scrCreateTextBox(inst.Text,inst.Face,inst.FaceIndex);
		}
	}
	
	if(place_meeting(x,y,oSaveGame))
	{
		scrGameSave("Save1");
		show_debug_message("Game Saved!");
	}
}

if(keyboard_check_pressed(vk_escape))
{
	room_goto(rmTitle);
}