/// @description Insert description here
// You can write your code in this editor

event_inherited();

//Initialize basic variables
HSpeed = 0;
VSpeed = 0;
Speed = 0;
WalkSpeed = 3;
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
SIdleUp = sEnemydefault;
SIdleDown = sEnemydefault;
SWalk = sEnemywalk;
SWalkUp = sEnemywalk;
SWalkDown = sEnemywalk;
SRun = sEnemyrun;
SRunUp = sEnemyrun;
SRunDown = sEnemyrun;

SAlert = sEnemyalert;

//Timer
timer[0] = 3*60;


//Shrink enemy
Scale = 0.5;
image_xscale = Scale;
image_yscale = Scale;

//Key
Key = room_get_name(room)+"Enemy"+string(x)+string(y);