/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

for (var i=0;i<Blocks;i++)
{
	draw_sprite_ext(sShield, 0, x-50 + (i*50) ,y+50, image_xscale, image_yscale, image_angle, c_white, image_alpha);
}