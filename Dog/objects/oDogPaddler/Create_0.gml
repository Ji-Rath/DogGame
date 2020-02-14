/// @description Insert description here
// You can write your code in this editor

//Initialize basic variables
HSpeed = 0;
VSpeed = 0;
WalkSpd = 3;
battlewarp = noone;

Attacker = noone;
BattleAttacker = noone;

//Set scale of player
Scale = 0.5;
image_yscale = Scale;
image_xscale = Scale;

//Create State machine
enum paddlerstates
{
	normal,
	
}
state = paddlerstates.normal;

//Assigning sprites to variables
SWalk = sDogpaddlerWalk;
SRun = sDogpaddlerRun;
SWalkUp = sDogpaddlerWalkUp;
SRunUp = sDogpaddlerRunUp;
SWalkDown = sDogpaddlerWalkDown;
SRunDown = sDogpaddlerRunDown;

show_debug_message(string(id));