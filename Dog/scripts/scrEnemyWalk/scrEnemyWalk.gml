if (hsp != 0)
{
	image_xscale = sign(hsp)*scale;
	sprite_index = hspritewalk;
}
else if (vsp > 0)
{
	sprite_index = spriteupwalk;
	
}
else if (vsp < 0)
{
	sprite_index = spritedownwalk;
}
