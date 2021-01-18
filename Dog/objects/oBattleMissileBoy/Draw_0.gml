/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

for (var i=0;i<Blocks;i++)
{
	draw_sprite_ext(sShield, 0, x-50 + (i*50) ,ShieldYPos+50, image_xscale/2, image_yscale/2, image_angle, c_white, image_alpha);
}