if (redlight = true)
	{
		image_xscale = -1;
		image_yscale = 1;
		image_index = 1;
		stop -= 1;
			if (stop == 0)
			{
			stop = irandom_range(4 * 30 , 5 * 30);
			redlight = false;
			}
	}
else
	{
		image_index = 0;
		image_xscale = 1;
		image_yscale = 1;
		go -= 1;
			if (go == 0)
			{
				redlight = true;
				go =  irandom_range(6 * 30, 10 * 30);
			}
	}
	
// use an alarm to set red state