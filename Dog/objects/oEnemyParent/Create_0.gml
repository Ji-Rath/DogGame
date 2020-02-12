/// @description Insert description here
// You can write your code in this editor

//Initialize basic variables
HSpeed = 0;
VSpeed = 0;
WalkSpd = 0;
WanderDirectionX = 0;
WanderDirectionY = 0;
DetectRange = 350;
Health = 10;
TimerEnded = false;

//Initialize state
enum estates
{
	Idle,
	Wander,
	Alert,
	Aggro,
	
}
State = estates.Idle;

//Get battleobject of enemy
BattleObject = oEnemyBattleParent;


//Set sprites for object
SIdle = sEnemydefault;
SWalk = sEnemywalk;
SRun = sEnemyrun;
SWalkUp = sEnemywalk;
SRunUp = sEnemyrun;
SWalkDown = sEnemywalk;
SRunDown = sEnemyrun;
SAlert = sEnemyalert;

//Timer
timer[0] = 3*60;


//Shrink enemy
Scale = 0.5;
image_xscale = Scale;
image_yscale = Scale;
