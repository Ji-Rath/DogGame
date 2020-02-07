/// @desc fade (room, fadecolor, fadespeed, x, y)
/// @arg room
/// @arg fadecolor
/// @arg fadespeed
// @arg x
// @arg y

var fade = instance_create_depth(0,0,0,oFade);
fade.target = argument0;
//fade.image_alpha = 0;
fade.fadecolor = argument1;
fade.fadespeed = argument2;
//fade.xx = argument3;
//fade.yy = argument4