event_inherited();
controller = 0;
axisreleasecount = 0;



inputstop = false;
inputrelease = false;
inputstopcount = 0;
incsec = 0;
mysmoke = noone;
ghosted = false;

runcount = 0;
runplaysound = noone;
runsnd = noone;
winddownplaysound = noone;
winddownsnd = noone;
jumpsnd = noone;
jumpplaysound = noone;
tumbleplay = noone;
tumblesnd = noone;
landsnd = noone;
landplay = noone;

textevent = noone;



reapercount = 0;
mainalpha =	1;
reaper = noone;
buttonshovelfx = noone;


myspark = noone;


surfcount = 0;
death = noone;
myPortrait			= noone;
myVoice				= noone;//snd_voice2;
myFont				= fnt_main;
myName				= "";
Username = "ace"

face = noone;

invincible = false;
iframestate = iframes.inactive;
iframecount = 0;

enum iframes
{
	inactive,
	active,
	activep
	
}
heartshatter = noone;
touchx = false;

/*
myPortraitTalk		= spr_portrait_examplechar_mouth;
myPortraitTalk_x	= 26;
myPortraitTalk_y	= 44;
myPortraitIdle		= spr_portrait_examplechar_idle;
*/



#region new variales

phealth = 0;


#endregion


//dialogue

dialogue_variables();



//
#region my player stuff
dogthrow = noone;
mybroomtrail = noone;
throwcount = 0;
jade = 0;
canp3 = 0;

jumpable = 0;

linecollide = 0;
bboxcollide = 0;
myshadow = noone;
jumpdust = noone;

soundvariablesprite();


hsp = 0;
vsp = 0;
grv = 1.4;
walksp = 1.2;
grounded = 0;

dog = noone;
doghere = false;


prevframequeue = ds_queue_create();
prevframegrounded = 0;
boardsp = 6;
boardfriction = 0.7;
boardcount = 0;
boardbuffer = 1;
slopingbuffer = 0;

downjump = 0;
downjumpcount = 0;
downjumpbuffer = 0;
hspcarry = 0;
yplus = 0;
slopedir = 0;
slopestep = 5;
slidestartcount = 0;
scale = 0.50;
landanim = 0;

image_xscale = scale;
image_yscale = scale;

acc = 1;
dec = 1;
maxacc = 20;
jumpstrength = 37;

startupcount = 0;
winddowncount = 0;
movefriction = 0.955;

idle = 0;
startupanim = 0;
runanim = 0;
runanimcount = 0;

knockbackcount = 0;
hcollide = 0;

winddownanim = 0;
collision = 0;
rollanim = 0;
crouchriseanim = 0;
crouchanim = 0;
crouchrisecount = 0;
landcount = 0;
idleanim = 0;
rollcount = 0;
crouchcount = 0;
crouchframes = 2*14;
landingframes = (2*18)-2;
rollingframes = 2*14;

riseanim = 0;
fallanim = 0;
fallstartanim = 0;
fallstartcount = 0;
fallstartframes = (2*9);


fjumpstartanim = 0;
fjumpstartcount = 0;
fjumpstartframes = (2*15)-2;


glideframes = 2*79;
winddownframes = (2*46)-2;

sleepanim = 0;
wakeupanim = 0;
wakeupcount = 0;
wakeupframes = 2*84;

njumpanim = 0;
njumpframes = (2*17)-2;
njumpcount = 0;

airletgo = 0;

parrylandanim = 0;
parrylandcount = 0;




// knockback variables
kbhsp = 0;
kbvsp = 0;

knockbackstrength = 20;
knockupstrength = 15;

//knockback landing variables

kblhsp = 0;
kblvsp = 0;

kblandingstrength = 20;

kbldirection = 1;


aircount = 0;


rollset = 0;


parrycount = 0;
parryframes = 2*100;
parrystop = 0;



airparry = 0;
groundparry = 0;



enum states
{
	Playernormal,
	Playersleep,
	PlayerWakeup,
	PlayerKnockback,
	PlayerKnockbacklanding,
	PlayerSlide,
	PlayerSlidereset,
	Playerboard,
	PlayerGlide,
	PlayerHang,
	Playerparry,
	PlayerGparry,
	null,
	PlayerSwim,
	PlayerThrow,
	PlayerThrowanim,
	PlayerThrowanimair,
	PlayerDeath,
	Playeremptynormal,
	Playersleepempty,
	Playerwakeupempty,
	Playerknockbackempty,
	chest,
	emptyparry,
	wallslide,
	stuck,
	stuckgetup,
	toripull,
	Carry,
	


	
}
wallslidecount = 0;
normalcount = 0;

chestcount = 0;
chestmob = noone;

state = states.Playeremptynormal;

move = 0;
vmove = 0;
parrycount = 0;
gparryanim = 0;
gparrycount = 0;
slopedir = 0;

stuckcount = 0;
stuckgetupcount = 0;
airtime = 0;
groundtouch = false;
groundcount = 0;
parrymagnitude = 6;
knockbackmagnitude = 10;
atmospherecollision = false;

carrycount = 0;
glidecount = 0;

canp1 = 1;
canp2 = 1;
mobplus = 0;

#endregion

	bind_right = vk_right;
	bind_left = vk_left;
	bind_down = vk_down;
	bind_jump = vk_space;
	bind_action = vk_enter;
	bind_parry = ord("S");
	bind_p1 =  ord("Z");
	bind_p2 =  ord("X");
	bind_p3 = ord("C");
	bind_dog = ord("D");
	
	gpbindjump = gp_face1;
	gpbindparry = gp_shoulderr;
	gpbinddog = gp_shoulderl;
	gpbindaction = gp_shoulderrb;
	gpbindp1 = gp_face2;
	gpbindp2 = gp_face3;
	gpbindp3 = gp_face4;