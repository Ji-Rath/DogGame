
if(!Destroy)
{
    
    if(OpenEffect != 1)
    {
        OpenFraction += (2*pi)/120;
    }
}
else
{
    if(OpenEffect != 0)
    {
        OpenFraction -= (2*pi)/60;
    }
    else
    {
        //Destroy self and instances created for the minigame
        instance_destroy();
        for(var i=0;i<ds_list_size(Instances);i++)
        {
            var Instance = ds_list_find_value(Instances,i);
            if(instance_exists(Instance))
            {
                instance_destroy(Instance);
            }
        }
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
    timer[1] = 4*60;
}

//End of minigame
if(timer[1] > 0)
{
    timer[1] -= 1;
}
else if (timer[1] != -1)
{
    //Prevent decimals
    with(oBattleManager)
    {
        global.phealth = ceil(global.phealth);
        global.pp = ceil(global.pp);
        EnemyBattle.Health = ceil(EnemyBattle.Health);
    }
    Destroy = true;
    if(EndTurn)
    {
        oBattleManager.BattleStageEnd = true;
    }
    else
    {
        oBattleManager.UpdateStats = true;
        oBattleManager.visible = true;
        oBattleMenuParent.visible = true;
        oBattleManager.BattleTimer = oBattleManager.BattleTimerInit*60;
    }
    timer[1] = -1;
}