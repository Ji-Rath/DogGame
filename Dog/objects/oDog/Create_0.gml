/// @description Insert description here

//Inherit code from parents
event_inherited();

//Initialize basic variables
HSpeed = 0;
VSpeed = 0;
Speed = 0;
WalkSpeed = 3;

//Set scale of player
Scale = 0.5;
image_yscale = Scale;
image_xscale = Scale;

//Create State machine
enum DogState
{
	normal,
	
}
state = DogState.normal;

//Assigning sprites to variables
SWalk = sDogWalk;
SRun = sDogRun;
SWalkUp = sDogWalkUp;
SRunUp = sDogRunUp;
SWalkDown = sDogWalkDown;
SRunDown = sDogRunDown;
SIdle = sDogIdleRight;
SIdleUp = sDogIdleUp;
SIdleDown = sDogIdleDown;

//Load Variables from ds map if available
var SaveVal = ds_map_find_value(oAreaStats.SaveState,"PlayerX");
if(SaveVal != undefined)
{
	x = ds_map_find_value(oAreaStats.SaveState,"PlayerX");
	y = ds_map_find_value(oAreaStats.SaveState,"PlayerY");
}

//Load Player Stats
scrPlayerStats();

//Used for calculating path speed
XPrevious = x;
YPrevious = y;