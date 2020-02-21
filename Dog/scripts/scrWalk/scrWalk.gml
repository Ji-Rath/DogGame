
//Set Walking/Running animation
if (HSpeed != 0)
{
	image_xscale = sign(HSpeed)*Scale;
	if(abs(HSpeed) > WalkSpeed)
		sprite_index = SRun;
	else
		sprite_index = SWalk;
}
else if (VSpeed < 0)
{
	if(abs(VSpeed) > WalkSpeed)
		sprite_index = SRunUp;
	else
		sprite_index = SWalkUp;
	
}
else if (VSpeed > 0)
{
	if(abs(VSpeed) > WalkSpeed)
		sprite_index = SRunDown;
	else
		sprite_index = SWalkDown;
}

//Set Idle animation
if(HSpeed == 0 && VSpeed == 0)
{
	if(sprite_index == SWalk || sprite_index == SRun)
	{
		sprite_index = SIdle
	}
	if(sprite_index == SWalkUp || sprite_index == SRunUp)
	{
		sprite_index = SIdleUp
	}
	if(sprite_index == SWalkDown || sprite_index == SRunDown)
	{
		sprite_index = SIdleDown
	}
}