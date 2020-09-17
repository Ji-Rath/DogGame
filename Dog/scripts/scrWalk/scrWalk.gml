function scrWalk() {

	//Set Walking/Running animation
	var Buffer = 0.25;
	if (abs(HSpeed) > 0.8)
	{
		image_xscale = sign(HSpeed)*Scale;
		if(abs(HSpeed) > (WalkSpeed+Buffer))
			sprite_index = SRunRight;
		else
			sprite_index = SWalkRight;
	}
	else if (VSpeed < 0)
	{
		if(abs(VSpeed) > (WalkSpeed+Buffer))
			sprite_index = SRunUp;
		else
			sprite_index = SWalkUp;
	
	}
	else if (VSpeed > 0)
	{
		if(abs(VSpeed) > (WalkSpeed+Buffer))
			sprite_index = SRunDown;
		else
			sprite_index = SWalkDown;
	}

	//Set Idle animation
	if(HSpeed == 0 && VSpeed == 0)
	{
		if(sprite_index == SWalkRight || sprite_index == SRunRight)
		{
			sprite_index = SIdleRight
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


}
