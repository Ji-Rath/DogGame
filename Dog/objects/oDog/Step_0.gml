/// @description Insert description here

//Set speed and animation while walking/running
scrWalk();
if(global.KeySprint)
	Speed = WalkSpeed*2;
else
	Speed = WalkSpeed;


//If player is in the normal state, update movement variables
if (state = DogState.normal)
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



//Interaction
if (global.KeyInteract && !instance_exists(oCutScene))
{
	var radius = 50;
	
	//Interact with NPC if in range
	var inst = collision_rectangle(x-radius,y-radius,x+radius,y+radius,oNPCBase,false,false);
	if(inst != noone && !inst.TextCooldown)
	{
		scrTextBox(inst.TextArray);
	}
	
	//Save game if interacting with SaveGame object
	if(place_meeting(x,y,oGameSave))
	{
		scrGameSave(oAreaStats.CurrentSave);
	}
}

//Go to menu
if(keyboard_check_pressed(vk_escape))
{
	room_goto(rmTitle);
}

//Show current enemies in the map
if(keyboard_check_pressed(ord("Q")))
{
	show_debug_message(string(instance_number(oEnemyBase)));
}