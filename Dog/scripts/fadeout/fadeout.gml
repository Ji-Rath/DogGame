/// @desc fade (room, fadecolor, fadespeed, x, y)
/// @arg room
/// @arg fadecolor
/// @arg fadespeed

var fade = instance_create_depth(0,0,0,oFade);
fade.target = argument0;
fade.fadecolor = argument1;
fade.fadespeed = argument2;