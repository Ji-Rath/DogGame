/// @description Insert description here
// You can write your code in this editor

//Initialize basic variables
HSpeed = 0;
VSpeed = 0;
WalkSpd = 3;
hmove = 0;
vmove = 0;
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

//Key bindings
bind_left = vk_left;
bind_right = vk_right;
bind_down = vk_down;
bind_up = vk_up;
bind_action = ord("X");
bind_baction = ord("Z");

//Assigning sprites to variables
SWalk = sDogpaddlerWalk;
SRun = sDogpaddlerRun;
SWalkUp = sDogpaddlerWalkUp;
SRunUp = sDogpaddlerRunUp;
SWalkDown = sDogpaddlerWalkDown;
SRunDown = sDogpaddlerRunDown;


