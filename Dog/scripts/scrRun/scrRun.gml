if (HSpeed != 0)
{
	image_xscale = sign(HSpeed)*Scale;
	sprite_index = SRun;
}
else if (VSpeed < 0)
{
	sprite_index = SRunUp;
}
else if (VSpeed > 0)
{
	sprite_index = SRunDown;
}
