
Success = false;
image_speed = 0.75;
MoveX = x;

enum Crab1PlayerState
{
    Running,
    Jumping,
    Result
}
State = Crab1PlayerState.Running;

//Jumping Game Timer
timer[0] = -1;

//Moving Drift effect timer
timer[1] = 1;

Spd = 1;