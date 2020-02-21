/// @description Insert description here
// You can write your code in this editor

event_inherited();

//Initialize basic variables
HSpeed = 0;
VSpeed = 0;
Speed = 0;
WalkSpeed = 3;
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
SIdle = sDogpaddlerIdle;
SIdleUp = sDogpaddlerIdleUp;
SIdleDown = sDogpaddlerIdleDown;

//Load Variables from ds map if available
var SaveVal = ds_map_find_value(oAreaStats.SaveState,"PlayerX");
if(SaveVal != undefined)
{
	x = ds_map_find_value(oAreaStats.SaveState,"PlayerX");
	y = ds_map_find_value(oAreaStats.SaveState,"PlayerY");
}

//Load Player Stats
scrPlayerStats();