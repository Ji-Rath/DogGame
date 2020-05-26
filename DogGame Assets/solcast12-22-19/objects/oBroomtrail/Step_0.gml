/// @description Insert description here
// You can write your code in this editor






if (instance_exists(oPlayer))
{
	if (player.state == states.PlayerGlide)
	{
		x = oPlayer.x;
		y = oPlayer.y;
		image_xscale = player.image_xscale;
	
		broomtrailcount += 1;

		if (broomtrailcount < 2)
		{
			sprite_index = sBroomtrail;
			image_index = 0;
		
		}
		else if (broomtrailcount < 2*broomtrailframes)
		{
			sprite_index = sBroomtrail;
		
		
		}
		else
		{
			sprite_index = sBlank;
			instance_destroy();
		
		}
	}
	else
	{
		
		instance_destroy();
		
	}
}