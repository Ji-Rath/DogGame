/// @description Insert description here
// You can write your code in this editor

image_angle = random(360);
var Scale = random_range(2, 4);
image_xscale = Scale;
image_yscale = Scale;

if (place_meeting(x, y, oDogTan))
{
	with(oDogTan)
		SunscreenCollision(id);
}