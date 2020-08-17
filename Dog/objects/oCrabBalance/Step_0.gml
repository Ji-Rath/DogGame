
event_inherited();

CrabCount = collision_rectangle_list(x-130,y,x+130,y-200,oCrabWeigh,false,true,CrabList,false);

var IsResting = true;

with(oCrabWeigh)
{
    if(abs(phy_angular_velocity) > 3 || Grabbed)
    {
        IsResting = false;
        Timer[0] = 1.5*60;
        StillTimer = false;
        show_debug_message("Velocity: "+string(phy_angular_velocity));
    }
}

//If the player successfully completed the minigame, end the minigame early
if(StillTimer && CrabCount == instance_number(oCrabWeigh) && IsResting && !Complete)
{
    oMiniGame.timer[1] = 0.5*60;
    Complete = true;
    
    var Icon = instance_create_layer(room_width/2, room_height/2, "GUI", oIconPopup);
    Icon.Sprite = sCheckMark;
}

//If minigame timer is over and player could not balance the crabs, deal damage
if(oMiniGame.timer[1] <= 0 && oMiniGame.timer[1] != -1 && !Complete)
{
    global.PlayerHP -= 10;
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