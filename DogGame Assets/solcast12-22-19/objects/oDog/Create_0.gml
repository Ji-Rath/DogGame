/// @description Insert description here
// You can write your code in this editor
hsp = 0;
vsp = 0;
grv = oPlayer.grv;
linecollide = 0;
bboxcollide = 0;
downjump = 0;
parrysparkexists = 0;
nothing = 0;
throwhsp = 0;
throwvsp = 0;
throwcount = 0;
throwstartcount = 0;
throwaircount = 0;

treasuredetect = 0;
barkcount = 0;
barkanimcount = 0;

DogFjumpbuffer = 0;
DogLandbuffer = 0;

walksp = 4;
direction_ = 0;

enum dogstates
{
	sleep,
	follow,
	dogrolling,
	movingplat,
	resetpos,
	sliding,
	follow2,
	blank,
	throw
	
	
}

jumpstrength = 50;
landing = 0;
ledgedetectrange = 150;
state = dogstates.resetpos;
PlayerTouch = false;
followstate = 0;
StepBehind = 0;
slopedir = 0;

Following_que = ds_queue_create();

Followque2 = ds_queue_create();


queueclearcount = 0;

lagbehind = 60;

follow = oPlayer;
xTo = xstart;
yTo = ystart;



dhsp = 4;
dogrollcount = 0;

DogGrounded = true;



DogIdleAnim = 0;

dogscale = 0.50;

image_xscale = dogscale;
image_yscale = dogscale;
followingx = 0;
followingy = 0;

Dogsliding = 0;
slidecount = 0;

DogLeapAnim = 0;
DogLeapCount = 0;
DogLeapFrames = 2*18

dogrollframes = 2*14;
DogRolling = 0;

DogNJumpanim = 0;
njumpframes = 2*7;
njumpcount = 0;
fallframes = 2*9;

njumpfall = 0;



DogLand = 0;
landingcount = 0;

Dogcollision = 0;


DogRunanim = 0;
DogStartup = 0;
startupcount = 0;
startupframes = 2*16;

doghurtanim = 0;
doghurtcount = 0;

bumpoffanim = 0;
bumpoffcount = 0;



DogWinddown = 0;
winddowncount = 0;

winddownframes = 2*46;


DogFjumpanim = 0;
Fjumpframes = 2*20;
Fjumpcount = 0;



dogwalkoff = 0;

doglandingframes = 2*10;

stopdogland = 0;

queuex = 0;
queuey = 0;

queuejump = 0;