/// @desc fade (room, fadecolor, fadespeed, x, y)
/// @arg room
/// @arg fadecolor
/// @arg fadespeed

var fade = instance_create_depth(0,0,0,oFade);
fade.Target = argument0;
fade.FadeColor = argument1;
fade.FadeSpeed = argument2;