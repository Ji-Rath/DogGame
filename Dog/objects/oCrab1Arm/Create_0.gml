
//Setup crab arm state
enum Crab1State
{
    Setup,
    Signal,
    Attack
}
State = Crab1State.Setup;


//Timer setup
timer[0] = random_range(0.5,2)*60;

Spd = 1.5;