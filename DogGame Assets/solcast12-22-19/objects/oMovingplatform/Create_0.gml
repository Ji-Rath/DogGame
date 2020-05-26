/// @description Insert description here
// You can write your code in this editor

hsp = 0;
vsp = 0;
grv = 0;
movesp = 1;
collision = 0;
dir = 1;

moveleftcount = 0;
moverightcount = 0;
moveupcount = 0;
movedowncount = 0;

movefriction = 0.1;

player = oPlayer;



enum movingplatformstates
{
	movingright,
	movingleft,
	movingup,
	movingdown
	
	
	
}

state = movingplatformstates.movingup;