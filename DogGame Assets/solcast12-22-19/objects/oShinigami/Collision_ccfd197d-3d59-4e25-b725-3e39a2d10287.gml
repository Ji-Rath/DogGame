/// @description Insert description here
// You can write your code in this editor
var dir = point_direction(other.x,other.y,x,y);


if (moveprime = 1)
{
	speedcollide = 1;

	
}
else
{
	speedcollide = 0.5;

	
}
hspcollide = lengthdir_x(speedcollide,dir);
vspcollide = lengthdir_y(speedcollide,dir);



if (!place_meeting(x,y,oHeal))
{
	hspcollide = lerp(hspcollide,0,0.1);
	vspcollide = lerp(vspcollide,0,0.1);
	
	
}

