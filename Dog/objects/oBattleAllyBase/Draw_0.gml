/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

//Draw neglect effect for ally
if(Neglect >= MaxNeglect)
	draw_sprite_ext(sEffectNeglect, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);

