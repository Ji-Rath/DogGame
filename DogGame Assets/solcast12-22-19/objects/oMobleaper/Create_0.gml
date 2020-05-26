
myhitbox = instance_create_layer(x,y,"mobbox",MobBox);

myhitbox.followmob = self;

hsp = 0;
vsp = 0;
grv = oPlayer.grv;
walksp = oPlayer.walksp;

parried = 0;
hsppush = 0;
vsppush = 0;

knockbackstr = 20;
collision = 0;

movefriction = 0.9;

returningsp = 2;
aggroacc = 0.25;


scale = 0.5;
landanim = 0;
image_xscale = scale;
image_yscale = scale;

follow = oPlayer;

xTo = xstart;
yTo = ystart;

kbhsp = 0;
kbvsp = 0;

knockbackstrength = 50;
knockupstrength = 500;
detectrange = 200;

xchase = 15;
ychase = 12;

chasesp = 10;

mobknockbackcount = 0;
linecollide = 0;
downjump = 0;

attackcount = 0;

playerdir = 0;



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