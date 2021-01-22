
//Setup crab arm state
enum Crab1State
{
    Setup,
    Signal,
    Attack
}
State = Crab1State.Setup;


//Timer setup
timer[0] = (random_range(1,3)*oBattleManager.SpeedMultiplier)*60;

Spd = 1.75;

ButtonPress = noone;