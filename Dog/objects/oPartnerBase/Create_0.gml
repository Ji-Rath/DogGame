
//Inherit code from parent object
event_inherited();

Distance = 32; //Distance to start following object
RunningDistance = 200 //Distance to start running towards object
Scale = 0.5; //Sprite scaling
WalkSpeed = 3; //Walking Speed
RunSpeed = WalkSpeed*2 //Running Speed
IntervalCheckDelay = 0.2; //Interval (seconds) to check distance from player

/////////////////////////////////////////////////////////////////////////////////

HSpeed = 0;
VSpeed = 0;

Speed = 0;

image_xscale = Scale;
image_yscale = Scale;

timer[0] = IntervalCheckDelay;

XPrevious = x;
YPrevious = y;
