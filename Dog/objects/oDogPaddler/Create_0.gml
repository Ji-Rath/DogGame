/// @description Insert description here
// You can write your code in this editor

//Initialize basic variables
hsp = 0;
vsp = 0;
walkspd = 3;
hmove = 0;
vmove = 0;
scale = 0.5;
battlewarp = noone;

Attacker = noone;
BattleAttacker = noone;

//Set scale of player
image_yscale = scale;
image_xscale = scale;

//Create State machine
enum paddlerstates
{
	normal,
	
	
}
state = paddlerstates.normal;

//Key bindings
bind_left = vk_left;
bind_right = vk_right;
bind_down = vk_down;
bind_up = vk_up;
bind_action = ord("X");
bind_baction = ord("Z");

//Assigning sprites to variables
hsprite = sDogpaddler;
hspritewalk = sDogpaddlerwalk;
hspriterun = sDogpaddlerrun;
spriteup = sDogpaddlerup;
spriteupwalk = sDogpaddlerupwalk;
spriteuprun = sDogpaddleruprun;
spritedown = sDogpaddlerdown;
spritedownwalk = sDogpaddlerdownwalk;
spritedownrun = sDogpaddlerdownrun;


