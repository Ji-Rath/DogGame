
//Minigame intro transition and outro effect
if(!Destroy)
{
    
    if(OpenFraction <= (pi/2))
    {
        OpenFraction += (oBattleManager.SpeedMultiplier/2)/(2*pi);
    }
}
else
{
    if(OpenEffect >= 0)
    {
        OpenFraction -= (oBattleManager.SpeedMultiplier/2)/(2*pi);
    }
    else
    {
        //Destroy self and instances created for the minigame
        instance_destroy();
    }
}

OpenEffect = sin(OpenFraction);

//After set time, execute game
if(timer[0] > 0)
{
    timer[0] -= 1;
}
else if (timer[0] != -1)
{
    timer[0] = -1;
    timer[1] = MiniGameTime*60;
}

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
    }
    
    timer[1] = -1;
}