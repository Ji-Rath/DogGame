
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

HSpeed = 0;
VSpeed = 0;

Speed = 0;
WalkSpeed = 3;

Distance = 32;
Scale = 0.5;

image_xscale = Scale;
image_yscale = Scale;

timer[0] = 1;

event_inherited();

XPrevious = x;
YPrevious = y;
