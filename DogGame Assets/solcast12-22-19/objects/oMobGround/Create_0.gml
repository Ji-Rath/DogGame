/// @description Insert description here
// You can write your code in this editor
blendcolor = make_color_hsv(choose(157,190,210),50,255 );
image_blend = blendcolor
myspawn = noone;
spawnrange = 400;
bounce = false;
bouncecount2 = 0;

hsp = 0;
vsp = 0;
grv = oPlayer.grv;
mySpawn = noone;
movefriction = oPlayer.movefriction;
wanderdir = 0;
counter = 0;
scale = 0.5;
image_xscale = scale;
image_yscale = scale;
myparryspark = noone;
move = 0;
walksp = oPlayer.walksp/2;

mybouncebox = noone;


returnbuffer = 0;

time = 1;
dir = 0;


strength = 2;


heightrange = 20;
aggrorange = 600;
attackrange = 400;


bouncecount = 0;
wakecount = 0;
enum mobgroundstates
{
	idle,
	wander,
	aggro,
	attack,
	recover,
	parried,
	knockback,
	knockback2,
	returntospawn,
	bounce,
	bounce2,
	wake
	
	
	
	
}



idlecount = 0;
wandercount = 0; 
aggrocount = 0;
attackcount = 0;
recovercount = 0;
parriedcount = 0;
knockbackcount = 0;
returnclimbcount = 0;
returnjumpcount = 0;



state = mobgroundstates.wander;

idlesprite = sRaccoon;
walksprite = sRaccoonwalk
runsprite = sRaccoonrun
jumpsprite = sRaccoonjump
fallsprite = sRaccoonfall
impactsprite = sRaccoonimpact
knockbacksprite = sRaccoonknockback
flopsprite = sRaccoonbellyland
bellysprite = sRaccoonbelly
bellyholdsprite = sRaccoonbellyhold
climbstartsprite = sRaccoonclimbstart;
climbsprite = sRaccoonclimb;
wakesprite = sRaccoonwake;

returnspawncount = 0;


flopframes = 15;
bellyframes = 19;

climbstartframes = 10
jumpframes = 18

