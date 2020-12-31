//limit powerbar
if (currentpower > maxpower)
	{
		currentpower = maxpower;	
	}
	
if (keyboard_check(vk_space))
	{
	currentpower++;	
	}

if (currentpower >= maxpower) and (keyboard_check_released(vk_space))
	{
		layer_sequence_play(golfgame)
		
	}
	
if (currentpower != maxpower) and (keyboard_check_released(vk_space))
	{
		layer_sequence_headpos(golfgame,0);
		timer -= 1;
		if (timer = 0)
			{
			layer_sequence_destroy(golfgame);
			scrFinishMiniGame(false);
			}
	}
	
if (layer_sequence_is_finished(golfgame))
	{
		layer_sequence_destroy(golfgame);
		scrFinishMiniGame(true);
	}