
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
