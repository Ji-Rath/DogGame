/// @description Insert description here
// You can write your code in this editor
Paddler = oDogPaddler;
codename = noone;
hsp = 0;
vsp = 0;
walksp = 0;
hmove = 0;         
vmove = 0;
wanderdirx = 0;
wanderdiry = 0;
enum estates
{
	idle,
	wander,
	alert,
	aggro,
	
}

state = estates.idle;

idlecount = 0;
wandercount = 0;
alertcount = 0;

myalertsign = noone;
detectrange = 350;


hsprite = sEnemydefault;
hspritewalk = sEnemywalk;
hspriterun = sEnemyrun;
spriteup = sEnemyup;
spriteupwalk = sEnemywalk;
spriteuprun = sEnemyrun;
spritedown = sEnemydown;
spritedownwalk = sEnemywalk;
spritedownrun = sEnemyrun;
spritealert = sEnemyalert;


scale = 0.5;
image_xscale = scale;
image_yscale = scale;
