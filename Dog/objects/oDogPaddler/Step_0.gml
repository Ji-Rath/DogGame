/// @description Insert description here
// You can write your code in this editor


//Set speed and animation while walking/running
scrWalk();
if(global.KeySprint)
	Speed = WalkSpeed*2;
else
	Speed = WalkSpeed;


//If player is in the normal state, update movement variables
if (state = paddlerstates.normal)
{
	var HMove = global.KeyRight - global.KeyLeft;
	var VMove = global.KeyDown - global.KeyUp;
	HSpeed = HMove*Speed;
	VSpeed = VMove*Speed;
	if(instance_exists(oCutScene))
	{
		HSpeed = 0;
		VSpeed = 0;
	}
	scrPathSpeed();
	
	scrMoveCollision();
}



//NPC INTERACTION
if (global.KeyInteract && !instance_exists(oCutScene))
{
	var radius = 50;
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
		scrGameSave(oAreaStats.CurrentSave);
	}
}

//TESTING EVENTS
if(keyboard_check_pressed(vk_escape))
{
	room_goto(rmTitle);
}

if(keyboard_check_pressed(ord("Q")))
{
	instance_create_layer(x,y-15,"Instances",oEmote);
}