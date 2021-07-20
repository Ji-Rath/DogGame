
event_inherited();

CrabCount = collision_rectangle_list(x-80,y,x+80,y-150,oCrabWeigh,false,true,CrabList,false);

with(oCrabWeigh)
{
	// Calculate whether the crab on the balance is 'balanced'
    if(abs(phy_angular_velocity) > other.VelocityThreshold || Grabbed)
    {
        other.Timer[0] = other.CompleteDelay*60;
        other.StillTimer = false;
    }
}

//If the player successfully completed the minigame, end the minigame early
if(StillTimer && CrabCount == instance_number(oCrabWeigh) && !Complete)
{
    Complete = true;
    scrFinishMiniGame(true);
}

//If minigame timer is over and player could not balance the crabs, deal damage
if(oMiniGame.timer[1] <= 0 && oMiniGame.timer[1] != -1 && !Complete)
{
    global.PlayerHP -= 5;
    Complete = true;
	scrFinishMiniGame(false);
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

if (Grabbed)
{
	phy_rotation = 0;
}