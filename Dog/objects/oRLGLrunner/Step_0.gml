if (keyboard_check(vk_right))
	{
		x += hsp;
		image_speed = 1;
	}
	else
	{
		image_speed = 0;
	}

if (oRLGLstoplight.redlight = true) and (keyboard_check(vk_right))
	{
		scrFinishMiniGame(false);
	}
	
if (place_meeting(x,y,oRLGLstoplight))
	{
		image_speed = 0;
		hsp = 0;
		scrFinishMiniGame(true);
	}