/// @description Insert description here

//Inherit code from parents
event_inherited();

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

//Initialize basic variables
WalkSpeed = 3; //Player walk speed
RunSpeed = WalkSpeed*2; //Player run speed
InteractRadius = 50; //Interaction radius
Scale = 0.5; //Set scale of player

//////////////////////////////////////////////////////////////////////

//Create State machine
enum DogState
{
	normal,
	
}
state = DogState.normal;

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

HSpeed = 0;
VSpeed = 0;
Speed = 0;

image_yscale = Scale;
image_xscale = Scale;