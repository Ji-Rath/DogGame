/// @description Insert description here
// You can write your code in this editor

//Inherit parent values
event_inherited();

//Enemy values
WalkSpeed = 3;
RunSpeed = WalkSpeed * 1.5;
DetectRange = 350;
BufferDistance = 100;
Health = 10;
Scale = 0.5;
WanderInterval = 3*60;

//////////////////////////////////////////////////////////////////////////////

//Enemy States
enum estates
{
	Idle,
	Wander,
	Alert,
	Aggro,
	
}

//Current state of enemy
State = estates.Idle;

//Timer to alternate between states
timer[0] = WanderInterval;

//Shrink enemy
image_xscale = Scale;
image_yscale = Scale;

//Give enemies a unique key - used for saving position, death, etc.
Key = room_get_name(room)+"Enemy"+string(x)+string(y);

WanderDirectionX = 0;
WanderDirectionY = 0;
TimerEnded = false;

BattleInfo = new EnemyBattleInfo(Key, BattleObject, TextFile);