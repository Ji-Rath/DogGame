
CrabCount = collision_line_list(x,y,x,y-1000,oCrabWeigh,false,true,CrabList,false);

var IsResting = true;
with(oCrabWeigh)
{
    if(abs(phy_angular_velocity) > 3 || Grabbed)
    {
        IsResting = false;
        show_debug_message("Velocity: "+string(phy_angular_velocity));
    }
}

//If the player successfully completed the minigame, end the minigame early
if(CrabCount == instance_number(oCrabWeigh) && IsResting && !Complete)
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