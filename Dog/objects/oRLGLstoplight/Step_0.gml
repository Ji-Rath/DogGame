if (redlight = true)
	{
		image_xscale = -3;
		image_yscale = -3;
		image_index = 1;
		stop -= 1;
			if (stop == 0)
			{
			stop = irandom_range(3 * 30 , 5 * 30);
			redlight = false;
			}
	}
else
	{
		image_index = 0;
		image_xscale = 3;
		image_yscale = 3;
		go -= 1;
			if (go == 0)
			{
				redlight = true;
				go =  irandom_range(6 * 30, 15 * 30);
			}
	}