if (currentpower >= 0) && (timerTrigger = false)
	{
		draw_healthbar(x - 300, y - 200, x - 350, y + 200, 
		(currentpower/maxpower) * 100, 
	c_black, c_red, c_green, 3, true , true);
	}