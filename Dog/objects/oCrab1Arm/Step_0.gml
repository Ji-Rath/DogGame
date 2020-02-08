
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
    break;
}

move_towards_point(oCrab1Player.x,y,Spd);

//Timer management
if(timer[0] > 0)
{
    timer[0] -= 1;
}