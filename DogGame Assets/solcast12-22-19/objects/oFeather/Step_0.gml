/// @description Insert description here
// You can write your code in this editor
count += 1;
//var seconds = 0.5
x += hsp;
y += vsp;



vsp =  1;
image_angle += 1;
/*
if (count > seconds * 60)
{
image_alpha -= 0.05;
}*/

if (image_alpha <= 0.1)
{
	instance_destroy();
	
}
image_alpha -= 0.005;