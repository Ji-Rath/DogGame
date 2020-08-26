
//Inherit code from parent object
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

Distance = 32; //Distance to start following object
RunningDistance = 200 //Distance to start running towards object
Scale = 0.5; //Sprite scaling
WalkSpeed = 3; //Walking Speed
RunSpeed = WalkSpeed*2 //Running Speed
IntervalCheckDelay = 0.2; //Interval (seconds) to check distance from player
FollowObject = oDog; //The object to follow

/////////////////////////////////////////////////////////////////////////////////

HSpeed = 0;
VSpeed = 0;

Speed = 0;

image_xscale = Scale;
image_yscale = Scale;

timer[0] = IntervalCheckDelay;

XPrevious = x;
YPrevious = y;
