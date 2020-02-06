if (hsp != 0)
{
	image_xscale = sign(hsp)*scale;
	sprite_index = hspriterun;
}
else if hsp == 0 and vsp != 0
{
	if (vsp > 0)
	{
		sprite_index = spriteuprun;
		
	}
	else if (vsp < 0)
	{
		sprite_index = spritedownrun;
	}
	
}
