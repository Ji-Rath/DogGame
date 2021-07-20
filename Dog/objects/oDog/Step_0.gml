/// @description Insert description here

//Set speed and animation while walking/running
scrWalk(Velocity);

if(instance_exists(oCutScene) || instance_exists(oTextBox))
{
	Velocity = scrPathSpeed(Velocity);
	return;
}

if(input_check(EVerb.Sprint))
{
	Speed = RunSpeed;
	if(alarm_get(0) == -1 && Velocity.Magnitude() > 0)
		alarm_set(0, RunPartInterval*60);
}
else
{
	Speed = WalkSpeed;
}
	
//If player is in the normal state, update movement variables
if (state = DogState.normal)
{
	var HMove = input_check(EVerb.MoveRight) - input_check(EVerb.MoveLeft);
	var VMove = input_check(EVerb.MoveDown) - input_check(EVerb.MoveUp);
	
	Velocity.X = HMove*Speed;
	Velocity.Y = VMove*Speed;
	
	Velocity = scrMoveCollision(Velocity);
	x += Velocity.X;
	y += Velocity.Y;
	
	CurrentCrumbDistance += abs(Velocity.X) + abs(Velocity.Y);
	DistanceTravelled += CurrentCrumbDistance;
	if (CurrentCrumbDistance > BreadCrumbInterval)
	{
		CurrentCrumbDistance = 0;
		var Crumb = instance_create_layer(x, y, "Instances", oFollowCrumbs);
		with (oPartnerBase)
		{
			ds_queue_enqueue(CrumbQueue, Crumb);
		}
	}
}

//Interaction
if (input_check_press(EVerb.Interact))
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
	{
		show_debug_message("Game Saved!");
		SaveGame(oAreaStats.CurrentSave);
	}
}

//Go to menu
if(keyboard_check_pressed(vk_escape))
{
	room_goto(rmTitle);
}