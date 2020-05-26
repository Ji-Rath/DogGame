/*
blendcolor = make_color_hsv(random_range(0,255),50,255 );
image_blend = blendcolor*/

parriedspark = noone;
followmob = noone;
scale = 0.5;
yplus = 0;

hsp = 0;
vsp = 0;
grv = 2;
walksp = 0.4;

parried = 0;
hsppush = 0;
vsppush = 0;

knockbackstr = 12;
collision = 0;

movefriction = 0.9;

returningsp = 2;
aggroacc = 0.25;



landanim = 0;
image_xscale = scale;
image_yscale = scale;

follow = oPlayer;

xTo = xstart;
yTo = ystart;

kbhsp = 0;
kbvsp = 0;

knockbackstrength = 12;



kbstrength = 30;
kustrength = 30;
knockupstrength = 12;
detectrange = 1000;

xchase = 15;
ychase = 12;

chasesp = 3;

mobknockbackcount = 0;


enum mobstates
{
	mobattack,
	mobknockback,
	mobreturn,
	mobtest,
	pause,
	freeze,
	mobknockback2,
	freezeempty,
	kbempty


	
}

enum mobnestedstates
{
	waiting,
	aggro,
	searching,
	returning,
	mknockback
	
	
}




parrycollide = 0;


mobstate = mobstates.mobattack;
mobnstate = mobnestedstates.waiting;

searchingcount = 0;



angle = 0;
angle2 = 0;
length = 10;



//returning variable


xTobranch = 0;
yTobranch = 0;

FollowBranch = noone;

pausecount = 0;
freezecount = 0;





startcount = 0;
returncount = 0;



returnanimstate = 0;


idleanim = sCrow;
startupanim = sCrowStartup;
flyanim = sCrowFly;
returnanim = sCrowReturn;
impactanim = sCrowImpact;
knockbackanim = sCrowKnockback;

feathercreate = oFeather;













