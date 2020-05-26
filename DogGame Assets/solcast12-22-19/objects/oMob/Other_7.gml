//landing

if (sprite_index = sPlayerLand)
{
	landanim = 0;
}

if (sprite_index = sPlayerStartup)
{
	runanim = 1;
	startupanim = 0;
	startupcount = 0;
	
}

if (sprite_index = sPlayerRoll)
{
	rollanim = 0;
	
	startupanim = 0;
	
	if (key_right) or (key_left)
	{
		runanim = 1;
	}
	else {
		runanim = 0;
	}
	
	if (hmove = 1) and (collision = 1) 
	{
		winddownanim = 1;
	}
	
	
	
}



if (sprite_index = sPlayerCrouch)
{
	image_speed = 0;
	image_index = image_number - 1;
	crouchanim = 0;
	crouchriseanim = 1;
}

if (sprite_index = sPlayerCrouchRise)
{
	crouchriseanim = 0;
	crouchrisecount = 0;
}

