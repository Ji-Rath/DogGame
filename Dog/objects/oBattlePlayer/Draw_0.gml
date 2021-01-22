/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

//If player is smelly...i mean hungry, draw effect
if(global.PlayerPP <= 0)
	draw_sprite_ext(sEffectHungry, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);

//Draw player status
scribble_set_box_align( fa_left, fa_middle);
var HealthWidth = sprite_get_width(sHealthBar); //175;
var HealthHeight = sprite_get_height(sHealthBar); //15;
var HealthYPos = y-50;
draw_set_alpha(image_alpha);
draw_sprite_part(sHealthBar, 0, 0, 0, (DisplayHealth/global.PlayerMaxHP)*HealthWidth, HealthHeight, x-(HealthWidth/2), HealthYPos-(HealthHeight/2));
draw_sprite(sHealth, 0, x, HealthYPos);
draw_set_alpha(1);
//scribble_draw(x,y,round(DisplayPP));