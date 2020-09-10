
if(global.KeyInteract)
{
    Interact = true;
}
if(global.KeyInteractRelease)
{
    Interact = false;
}

if(Counter < CompleteCounter)
{
    if(Interact)
    {
        if(!StruggleRight)
        {
           StruggleRight = true;
           Counter++;
        }
        window_mouse_set(room_width/2+15, room_height/2+200);
    } else if(global.KeySprint)
    {
        if(StruggleRight)
        {
            StruggleRight = false;
            Counter++;
        }
        window_mouse_set(room_width/2-15, room_height/2+200);
    }
    else
    {
        window_mouse_set(room_width/2, room_height/2+200);
    }
}

if(!Complete && Counter >= CompleteCounter)
{
    oMiniGame.timer[1] = 1*60;
    Complete = true;
	DealEnemyDamage = true;
	alarm[0] = 1;
    instance_destroy(MouseCollision);
    instance_destroy(ButtonAlternate);
    
    var Icon = instance_create_layer(room_width/2, room_height/2, "GUI", oIconPopup);
    Icon.Sprite = sCheckMark;
}

if(oMiniGame.timer[1] <= 0 && oMiniGame.timer[1] != -1 && !Complete)
{
    global.PlayerHP -= 10;
    Complete = true;
    Counter = 0;
}

if(!Complete && distance_to_point(mouse_x, mouse_y) < 100 && phy_active)
{
    Complete = true;
    oMiniGame.timer[1] = 0.5*60;
    global.PlayerHP -= 10;
    Counter = 0;
}