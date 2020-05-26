/// @description Insert description here
// You can write your code in this editor
follow = oPlayer;
scale = 0.50;

image_xscale = scale;
image_yscale = scale;

mobcollision = 0;

timercount = 0;
recoverycount = 0;


enum parrystates
{
	inactive,
	active,
	recovery
	
	
	
}


state = parrystates.inactive;