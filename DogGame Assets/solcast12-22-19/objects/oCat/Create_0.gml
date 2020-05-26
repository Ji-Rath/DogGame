/// @description Insert description here
// You can write your code in this editor
linecollide = -4;
bboxcollide = 0;
downjump = 0;

hsp = 0;
vsp = 0;
grv = 4;
movefriction = 0.9;
move = 0;
walksp = 2;

detectrange = 700;

aggrorange = 500;

mystrength = 45;

myhitbox = noone;

scale = 0.5;
image_xscale = scale;
image_yscale = scale;

knockbackstrength = 50;
knockupstrength = 50;




enum catstates
{
	sleep,
	alert,
	sprint,
	sprintstop,
	returntosleep,
	parried,
	knockback,
	belly
	
	
	
}

state = catstates.sleep;


spritesleep = sCat;
spritewakestart = sCatWakestart;
spritewake = sCatWake;
spritestartup = sCatStartup;
spriterun = sCatRun;
spritetowake = sCatTowake;
spritetosleep = sCatTosleep;


wakeframes = 2*11;
startupframes = 2*14;
towakeframes = 2*8;
tosleepframes = 2*8;

wakecount = 0;
startupcount = 0;
towakecount = 0;
tosleepcount = 0;
parriedcount = 0;
bellycount = 0;
knockbackcount = 0;



