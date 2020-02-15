
image_alpha = oMiniGame.OpenEffect;
if(oMiniGame.timer[0] == -1)
{
    var TimerReady = (timer[0] <= 0 && timer[0] != -1)
    
    //State machine
    switch(State)
    {
        case Crab1State.Setup:
            sprite_index = sMiniGameCrab1Setup;
            //When setup timer is done, go to signal state
            if(TimerReady)
            {
                State = Crab1State.Signal;
                timer[0] = 0.4*60; //Amount of time to react
            }
        break;
        
        case Crab1State.Signal:
            sprite_index = sMiniGameCrab1Signal;
            image_speed = 0.75;
            Spd = 0;
            if(TimerReady)
            {
                State = Crab1State.Attack;
            }
        break;
        
        case Crab1State.Attack:
            Spd = 0;
            sprite_index = sMiniGameCrab1Bite;
            if(oMiniGame.timer[1] > 0.5*60)
            {
                oMiniGame.timer[1] = 0.5*60;
            }
        break;
    }
    
    if(point_distance(x,y,oCrab1Player.x,y) > Spd)
    {
        move_towards_point(oCrab1Player.x,y,Spd);
    }
    else
    {
        x = oCrab1Player.x
        speed = 0;
    }
    
    //Timer management
    if(timer[0] > 0)
    {
        timer[0] -= 1;
    }

}