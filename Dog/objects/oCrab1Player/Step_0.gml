

var TimerReady = (timer[0] <= 0 && timer[0] != -1)
switch(State)
{
    case Crab1PlayerState.Running:
        sprite_index = sMiniGameCrab1PlayerRun;
        if(input_check_press(EVerb.Interact) && oCrab1Arm.State != Crab1State.Attack)
        {
            timer[0] = 0.3*60; //Time until failed jump
            State = Crab1PlayerState.Jumping;
        }
            
        //Move Drift effect
        var MoveChangeReady = (timer[1] <= 0 && timer[1] != -1)
        if(MoveChangeReady)
        {
            MoveX = choose(x-100,x+100);
            Spd = random_range(1,2.5);
            timer[1] = choose(0.5,1,1.5)*60;
        }
            
        if(oCrab1Arm.State = Crab1State.Attack)
        {
            State = Crab1PlayerState.Result;
        }
    break;
        
    case Crab1PlayerState.Jumping:
        sprite_index = sMiniGameCrab1PlayerJump;
        MoveX = x;
        timer[1] = -1;
        Spd = 0;
            
        //If Jump was good, Success = true
        if(oCrab1Arm.State = Crab1State.Attack)
        {
            State = Crab1PlayerState.Result;
            Success = true;
        }
        //If Jump missed, Success = false
        if(TimerReady)
        {
            sprite_index = sMiniGameCrab1PlayerRun;
			if(oCrab1Arm.State == Crab1State.Setup)
				oCrab1Arm.timer[0] = 1;
            State = Crab1PlayerState.Result;
        }
    break;
        
    case Crab1PlayerState.Result:
        image_speed = 0;
        MoveX = x;
        timer[1] = -1;
        Spd = 0;
        if(Success && !HitPlayer)
        {
            sprite_index = sMiniGameCrab1PlayerJump;
            HitPlayer = true;
            
            scrFinishMiniGame(true);
        }
        else
        {
            if(!HitPlayer)
            {
                global.PlayerHP -= 10;
				scrFinishMiniGame(false);
                HitPlayer = true;
            }
        }
    break;
}
    
//Move player in random x-direction
x += clamp((MoveX-x)/2,0,3);
    
for(i=0;i<array_length_1d(timer);i++)
{
    if(timer[i] > 0)
    {
        timer[i] -= 1;
    }
}