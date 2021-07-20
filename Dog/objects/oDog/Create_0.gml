/// @description Insert description here

//Inherit code from parents
event_inherited();

//Initialize basic variables
WalkSpeed = 3; //Player walk speed
RunSpeed = WalkSpeed*2; //Player run speed
InteractRadius = 50; //Interaction radius
Scale = 0.5; //Set scale of player
RunPartInterval = 0.25; //Time (seconds) to spawn particles while running
SpriteList = [sDogFace, sDogFaceTalk];
	
//////////////////////////////////////////////////////////////////////////////////

//Create State machine
enum DogState
{
	normal,
	
}
state = DogState.normal;

// Set scaling of player
image_yscale = Scale;
image_xscale = Scale;

// Update player stats
scrUpdateStats();

DistanceTravelled = 0;
CurrentCrumbDistance = 0;
BreadCrumbInterval = 32;