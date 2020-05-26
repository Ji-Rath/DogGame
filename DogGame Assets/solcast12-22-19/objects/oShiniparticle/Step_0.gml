/// @description Insert description here
// You can write your code in this editor


image_alpha -= 0.01;
if (image_alpha < 0.1)
{
	instance_destroy();
	
}

y -= 1;

image_xscale -= 0.005;
image_yscale -= 0.005;
