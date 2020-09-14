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
RunPartInterval = 0.25; //Time (seconds) to spawn particles while running

//Textbox variables
Voice				= sndVoice_02;
Font				= fnt_dialogue;
Name				= "Dogpaddler";
	
//////////////////////////////////////////////////////////////////////////////////

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

for(var i=0; i<array_length(global.PartnerArray);i++)
{
	var Partner = array_get(global.PartnerArray, i);
	if(Partner != -1)
		instance_create_layer(x, y, "Instances", Partner);
}