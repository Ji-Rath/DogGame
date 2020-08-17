
GameType = -1;
timer[0] = 1*60; //Wait 1 second before spawning characters
timer[1] = -1 //MiniGame time

//Instances to destroy after the minigame
Instances = ds_list_create();

//Open Effect
OpenEffect = 0;
OpenFraction = 0;
Destroy = false;
ShowEnemy = false;
EndTurn = true;

enum Game
{
    CrabAttack,
    Crab1,
    GlovesOff,
    Hamburger,
    Chips,
    PanAttack,
    BroomAttack,
    CrabWeigh,
    Highfive,
    AnvilStruggle
}
alarm[0] = 1;

DrawSmall = false;
SmallScreenPosX = 0;
SmallScreenPosY = 0;

//Text to show player to help with the minigame
HelpText = "";