/// @desc Adjust sprite based on speed/direction
/// @arg {struct} Vec2
function scrWalk(Velocity) {

	//Set Walking/Running animation
	var Buffer = 0.25;
	if (abs(Velocity.X) > 0.8)
	{
		image_xscale = sign(Velocity.X)*Scale;
		if(abs(Velocity.X) > (WalkSpeed+Buffer))
			sprite_index = SRunRight;
		else
			sprite_index = SWalkRight;
	}
	else if (Velocity.Y < 0)
	{
		if(abs(Velocity.Y) > (WalkSpeed+Buffer))
			sprite_index = SRunUp;
		else
			sprite_index = SWalkUp;
	
	}
	else if (Velocity.Y > 0)
	{
		if(abs(Velocity.Y) > (WalkSpeed+Buffer))
			sprite_index = SRunDown;
		else
			sprite_index = SWalkDown;
	}

	//Set Idle animation
	if(Velocity.X == 0 && Velocity.Y == 0)
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
