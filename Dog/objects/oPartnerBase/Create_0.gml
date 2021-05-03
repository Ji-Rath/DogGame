
//Inherit code from parent object
event_inherited();

Scale = 0.5; //Sprite scaling
WalkSpeed = 3; //Walking Speed
RunSpeed = WalkSpeed*2 //Running Speed
IntervalCheckDelay = 0.05; //Interval (seconds) to check distance from player

/////////////////////////////////////////////////////////////////////////////////

Speed = 0;

image_xscale = Scale;
image_yscale = Scale;

timer[0] = IntervalCheckDelay;

CrumbQueue = ds_queue_create();

LastPartnerIndex = 0;

alarm[0] = 1;
