


MiniGameTime = 5.5; //Time in seconds to complete minigame - is affected by speed multiplier
MiniGameScreenOpenSeq = seqAttackEnter;
MiniGameScreenCloseSeq = seqAttackExit;

/////////////////////////////////////////////////////////////////////////

MiniGameTime /= oBattleManager.SpeedMultiplier;

GameType = -1;

timer[1] = MiniGameTime*60; //MiniGame time

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
    AnvilStruggle,
	ThirstyDoggo,
	DogTan
}
alarm[0] = 1;

DrawSmall = false;
SmallScreenPosX = 0;
SmallScreenPosY = 0;

//Text to show player to help with the minigame
HelpText = "";

MiniGameEndSeq = -1;

MiniGameScreenSeq = scrRunSequence(MiniGameScreenOpenSeq);
