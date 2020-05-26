/// @description Insert description here
// You can write your code in this editor
wcolor = 0;
linecollide = 0;
bboxcollide = 0;
distancetofollow = 0;


slopedir = 0;
follow2 = 0;
follow = oPlayer;
hsp = 0;
vsp = 0;
grv = follow.grv;
movefriction = follow.movefriction;
walksp = follow.walksp;
jumpstrength = follow.jumpstrength;

letgocount = 0;

key_left = 0;
key_right = 0;
key_jump = 0;
slidecount = 0;
followqueue = ds_queue_create();
followqueue2 = ds_queue_create();
downjump = 0;
key_down = 0;

collision = 0;

move = 0;
ledgedetectrange = 300;
detectrange = 5;

lostrange = 1500;
repositioncount = 0;
canjump = 0;

letgorange = 200;


knockbackcount = 0;
knockbackstrength = 30;
knockupstrength = 40;



enum party1states
{
	chase,
	wait,
	reposition,
	letgochase,
	
	
	
}

enum party1macrostates
{
	followplayer,
	playable,
	idle,
	npc,
	slidefollow,
	blank,
	knockback,
	swim
	
}


enum panimstates
{
	idle,
	startup,
	run,
	winddown,
	neutraljump,
	forwardjump,
	neutralland,
	forwardland
	
	
	
	
}



animstate = 0;


grounded = 0;


queuex = 0;
queuey = 0;


macrostate1 = party1macrostates.followplayer;
state = party1states.chase;


scale = follow.scale;

image_yscale = scale;
image_xscale = scale;

#region sprite variables

idlesprite = sYam;
startupsprite = sYamStartup;
runsprite = sYamRun;
winddownsprite = sYamWinddown;
neutraljumpsprite = sYamNjump;
neutralfallsprite = sYamNfall;
neutrallandsprite = sYamNland;

forwardjumpstartsprite = sYamFjumpstart;
forwardjumpsprite = sYamFjump;
forwardlandsprite = sYamFland;

slidestartsprite = sYamSlidestart;
slidesprite = sYamSlide;



















#endregion




#region animcount

startupcount = 0;
winddowncount = 0;
njumpcount = 0;
nlandcount = 0;
fjumpcount = 0;
flandcount = 0;
slidecount = 0;

#endregion

#region animframes

startupframes = 2*10;
winddownframes = 2*34;
njumpframes = 2*25;
nlandframes = 2*15;
fjumpframes = 2*21;
flandframes = 2*20;
slideframes = (2*14)-4;

#endregion

yamqueue = ds_queue_create();
hacceleration = 0;
vacceleration = 0;
prevframehsp = 0;
prevframevsp = 0;
prevframegrounded = 0;


winddownanim = 0;
nlandanim = 0;
idleanim = 0;
startupanim = 0;
fjumpanim = 0;
flandanim = 0;
runanim = 0;
startupconfirm = 1;
idleanim = 0;