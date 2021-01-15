/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

//If player is smelly...i mean hungry, draw effect
if(global.PlayerPP <= 0)
	draw_sprite_ext(sEffectHungry, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);

//Draw player status
scribble_set_box_align( fa_left, fa_middle);
scribble_draw(x,y,round(DisplayHealth));
scribble_draw(x,y,round(DisplayPP));

for (i=0;i<BlockableAttacks;i++)
{
	draw_sprite_ext(sShield, 0, x-50 + (i*50) ,y+50, image_xscale, image_yscale, image_angle, c_white, image_alpha);
}