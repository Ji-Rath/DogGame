
event_inherited();

CrabCount = collision_rectangle_list(x-80,y,x+80,y-150,oCrabWeigh,false,true,CrabList,false);

with(oCrabWeigh)
{
    if(abs(phy_angular_velocity) > 10 || Grabbed)
    {
        other.Timer[0] = 0.25*60;
        other.StillTimer = false;
    }
}

//If the player successfully completed the minigame, end the minigame early
if(StillTimer && CrabCount == instance_number(oCrabWeigh) && !Complete)
{
    oMiniGame.timer[1] = (0.5 / oBattleManager.SpeedMultiplier)*60;
    Complete = true;
    
    scrMiniGameIcon(sCheckMark);
}

//If minigame timer is over and player could not balance the crabs, deal damage
if(oMiniGame.timer[1] <= 0 && oMiniGame.timer[1] != -1 && !Complete)
{
    global.PlayerHP -= 5;
    Complete = true;
}

if(Timer[0] > 0)
{
    Timer[0] -= 1;
}
else if (Timer[0] != -1)
{
    StillTimer = true;
    Timer[0] = -1;
}