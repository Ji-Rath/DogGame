
//Minigame intro transition and outro effect
if(!Destroy)
{
    if(OpenFraction <= (pi/2))
        OpenFraction += (oBattleManager.SpeedMultiplier/2)/(2*pi);
}
else
{
    if(OpenEffect >= 0)
    {
        OpenFraction -= (oBattleManager.SpeedMultiplier/2)/(2*pi);
    }
    else if (MiniGameEndSeq == -1)
    {
        //Destroy self and instances created for the minigame
        instance_destroy();
    }
}

OpenEffect = sin(OpenFraction);

//End of minigame
if(timer[1] > 0)
{
    timer[1] -= 1;
}
else if (timer[1] != -1)
{
    if(DrawSmall)
    {
        Destroy = true;
        oBattleManager.DrawGUI = true;
    }
    else
    {
        //Prevent decimals
        with(oBattleManager)
        {
            global.PlayerHP = ceil(global.PlayerHP);
            global.PlayerPP = ceil(global.PlayerPP);
            EnemyBattle.Health = ceil(EnemyBattle.Health);
        }
		
        Destroy = true;
		layer_sequence_destroy(MiniGameScreenSeq);
		MiniGameScreenSeq = scrRunSequence(MiniGameScreenCloseSeq);
    }
    timer[1] = -1;
	MiniGameEndSeq = -1;
}