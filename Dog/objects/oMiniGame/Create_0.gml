
GameType = 0;
timer[0] = 1*60; //Wait 1 second before spawning characters
timer[1] = -1 //MiniGame time

//Instances to destroy after the minigame
Instances = ds_list_create();

//Open Effect
OpenEffect = 0;
OpenFraction = 0;
Destroy = false;

enum Game
{
    CrabAttack,
    Crab1,
    GlovesOff
}
alarm[0] = 1;