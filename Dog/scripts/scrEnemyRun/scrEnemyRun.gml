if (hsp != 0)
{
	image_xscale = sign(hsp)*scale;
	sprite_index = hspriterun;
}
else if (vsp > 0)
{
	sprite_index = spriteuprun;
}
else if (vsp < 0)
{
	sprite_index = spritedownrun;
}
