
CrabList = collision_line_list(x,y,x,y-500,oCrabWeigh,false,true,true,false);
show_debug_message(string(CrabList));

if(CrabList == instance_number(oCrabWeigh))
{
    var IsResting = true;
    with(oCrabWeigh)
    {
        if(round(phy_angular_velocity) != 0)
        {
            IsResting = false;
        }
    }
    
    //If minigame timer is over and player could not balance the crabs, deal damage
    if(!IsResting && oMiniGame.timer[1] <= 0 && !Complete)
    {
        global.phealth -= 10;
        Complete = true;
    }
}