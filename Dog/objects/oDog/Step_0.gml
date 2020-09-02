/// @description Insert description here

//Set speed and animation while walking/running
scrWalk();

if(instance_exists(oCutScene) || instance_exists(oTextBox)) exit;

if(global.KeySprint)
{
	Speed = RunSpeed;
	if(alarm_get(0) == -1)
		alarm_set(0, RunPartInterval*60);	
}
else
{
	Speed = WalkSpeed;
}
	
//If player is in the normal state, update movement variables
if (state = DogState.normal)
{
	var HMove = global.KeyRight - global.KeyLeft;
	var VMove = global.KeyDown - global.KeyUp;
	
	HSpeed = HMove*Speed;
	VSpeed = VMove*Speed;
	
	scrPathSpeed();
	
	scrMoveCollision();
}



//Interaction
if (global.KeyInteract)
{
	
	//Interact with NPC if in range
	var inst = collision_rectangle(x-InteractRadius,y-InteractRadius,x+InteractRadius,y+InteractRadius,oNPCBase,false,false);
	if(inst != noone && !inst.TextCooldown)
	{
		CreateTextEvent(inst.Text, inst.TextInitialVal, inst.TextExt);
		with(inst)
		{
			path_end();
		}
		show_debug_message("Bruh");
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