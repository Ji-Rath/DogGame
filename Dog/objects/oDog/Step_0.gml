/// @description Insert description here

//Set speed and animation while walking/running
scrWalk(Velocity);

scrPathSpeed();

if(instance_exists(oCutScene) || instance_exists(oTextBox)) return;

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
	
	Velocity.X = HMove*Speed;
	Velocity.Y = VMove*Speed;
	
	
	Velocity = scrMoveCollision(Velocity);
	x += Velocity.X;
	y += Velocity.Y;
}



//Interaction
if (global.KeyInteractPress)
{
	
	//Interact with NPC if in range
	var inst = collision_rectangle(x-InteractRadius,y-InteractRadius,x+InteractRadius,y+InteractRadius,oNPCBase,false,false);
	if(inst != noone && !inst.TextCooldown)
	{
		CreateTextEvent(inst.TextFile, "Interact");
		with(inst)
			path_end();
	}
	
	//Save game if interacting with SaveGame object
	if(place_meeting(x,y,oGameSave))
		scrGameSave(oAreaStats.CurrentSave);
}

//Go to menu
if(keyboard_check_pressed(vk_escape))
{
	room_goto(rmTitle);
}