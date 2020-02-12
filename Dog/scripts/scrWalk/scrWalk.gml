if (HSpeed != 0)
{
	image_xscale = sign(HSpeed)*Scale;
	sprite_index = SWalk;
}
else if (VSpeed < 0)
{
	sprite_index = SWalkUp;
	
}
else if (VSpeed > 0)
{
	sprite_index = SWalkDown;
}
