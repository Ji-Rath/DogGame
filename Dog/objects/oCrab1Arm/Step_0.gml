

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
            
        if(!instance_exists(ButtonPress))
        {
            ButtonPress = instance_create_layer(room_width/1.1, room_height/2+300, "Instances", oButtonSignal);
            ButtonPress.sprite_index = sButtonPress;
        }
    break;
        
    case Crab1State.Attack:
        Spd = 0;
        sprite_index = sMiniGameCrab1Bite;
        if(oMiniGame.timer[1] > 0.5*60)
        {
            oMiniGame.timer[1] = 0.5*60;
        }
        instance_destroy(ButtonPress);
    break;
}
    
//Move crab arm towards player x-pos
x += clamp((oCrab1Player.x-x)/2,0,2);
    
//Timer management
if(timer[0] > 0)
{
    timer[0] -= 1;
}