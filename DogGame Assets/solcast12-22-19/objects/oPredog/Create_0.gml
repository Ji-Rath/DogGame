/// @description Insert description here
// You can write your code in this editor
scale = 0.5;
image_xscale = -scale;
image_yscale = scale;
count = 0;
count2 = 0;
state = predogstates.pant;

movefriction = oPlayer.movefriction
hsp = 0;
vsp = 0;

grv = oPlayer.grv;
enum predogstates
{
	pant,
	idle,
	bark,
	knockback,
	knockout
	
	
}
image_blend = c_black;

image_alpha = 0;
player = oPlayer;

barkcount = 0;

alphaset = 1;