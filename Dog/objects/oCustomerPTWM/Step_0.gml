
if (Created == true)
	{
		Created = false;
		PTWM_Minigame = layer_sequence_create("Instances",(room_width/2),(room_height/2),"seqPTWM_Enter")
	}	
if (layer_sequence_get_headpos(PTWM_Minigame) == 8)
	{
		layer_sequence_pause(PTWM_Minigame);	
	}
if (Satisfied == true)
	{
		layer_sequence_play(PTWM_Minigame);	
		Satisfied = false;
	}
	
if (Upset == true)
	{
		layer_sequence_destroy(PTWM_Minigame)
		Upset = false;
		scrFinishMiniGame(false);
	}
	
if (layer_sequence_is_finished(PTWM_Minigame) == 1)
	{
		layer_sequence_destroy(PTWM_Minigame);
		scrFinishMiniGame(true);
	}