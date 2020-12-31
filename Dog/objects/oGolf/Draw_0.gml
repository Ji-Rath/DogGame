if (currentpower >= 0)
	{
		draw_healthbar(x - 300, y - 200, x - 350, y + 200, 
		(currentpower/maxpower) * 100, 
	c_black, c_orange, c_yellow, 3, true , true);
	}