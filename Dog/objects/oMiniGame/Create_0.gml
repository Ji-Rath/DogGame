


MiniGameTime = 15 //5.5; //Time in seconds to complete minigame - is affected by speed multiplier
MiniGameScreenOpenSeq = seqAttackEnter;
MiniGameScreenCloseSeq = seqAttackExit;

/////////////////////////////////////////////////////////////////////////

MiniGameTime *= oBattleManager.SpeedMultiplier;

GameType = -1;

bCompletedGame = false;

timer[1] = MiniGameTime*60; //MiniGame time

//Instances to destroy after the minigame
Instances = ds_list_create();

//Open Effect
OpenEffect = 0;
OpenFraction = 0;
Destroy = false;
ShowEnemy = false;
EndTurn = true;
DrawWindow = true;

enum Game
{
    CrabAttack,
    Crab1,
    GlovesOff,
    Chips,
    PanAttack,
    BroomAttack,
    CrabWeigh,
    Highfive,
    AnvilStruggle,
	ThirstyDoggo,
	DogTan,
	Lighthouse,
	OrderingMinigame,
	PingPong,
	RedLightGreenLight,
	Golf,
	SimonSays,
	CrossRoad,
	LemonadeLine,
	Sandal
}
alarm[0] = 1;

DrawSmall = false;
SmallScreenPosX = 0;
SmallScreenPosY = 0;

//Text to show player to help with the minigame
HelpText = "";

MiniGameEndSeq = -1;
MiniGameScreenSeq = -1;

/// @func CreateInstance(x, y, obj, layer = "Instances")
/// @desc Create object for minigame sequence
function CreateInstance(X, Y, Object)
{
	var Layer = argument_count > 3 ? argument[3] : "Instances";
	var Instance = instance_create_layer(X, Y, Layer, Object);
	ds_list_add(Instances, Instance);
	
	return Instance;
}

function CanCompleteGame()
{
	return timer[1] != -1;	
}