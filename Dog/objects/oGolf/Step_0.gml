//limit powerbar
if (currentpower > maxpower)
	{
		currentpower = maxpower;	
	}
//charge bar
if (keyboard_check(vk_space))
	{
	currentpower++;	
	}
//shoot ball
if (currentpower >= maxpower) and (keyboard_check_released(vk_space))
	{
		layer_sequence_play(golfgame)
		
	}
	
if (currentpower != maxpower) and (keyboard_check_released(vk_space))
	{
		timerTrigger = true;
	}

	
	if (timerTrigger = true)
	{
		timer-=3;	
	}
	
	if (timer = 0)
	{
		layer_sequence_destroy(golfgame);
		scrFinishMiniGame(false);
	}
	
	//end minigame	
if (layer_sequence_is_finished(golfgame))
	{
		layer_sequence_destroy(golfgame);
		scrFinishMiniGame(true);
	}