
//Minigame intro transition and outro effect
if(!Destroy)
{
    if(OpenFraction <= (pi/2))
        OpenFraction += (oBattleManager.SpeedMultiplier/2)/(2*pi);
}
else
{
    if(OpenEffect >= 0)
        OpenFraction -= (oBattleManager.SpeedMultiplier/2)/(2*pi);
}

OpenEffect = sin(OpenFraction);

//End of minigame
if(timer[1] > 0)
{
    timer[1] -= 1;
}
else if (timer[1] != -1)
{
	timer[1] = -1;
	Destroy = true;
	
	//Prevent decimals
    with(oBattleManager)
    {
        global.PlayerHP = round(global.PlayerHP);
        global.PlayerPP = round(global.PlayerPP);
	}
	with(oEnemyBattleParent)
		Health = floor(Health);
	
	layer_sequence_destroy(MiniGameScreenSeq);
	layer_sequence_destroy(MiniGameEndSeq);
		
	if (DrawSmall)
	{
		oBattleManager.DrawGUI = true;
	}
	else
	{
		MiniGameScreenSeq = scrRunSequence(MiniGameScreenCloseSeq);
	}
	var Len = layer_sequence_get_length(MiniGameScreenSeq);
	var Spd = layer_sequence_get_speedscale(MiniGameScreenSeq);
	alarm[2] = Len*Spd;
}