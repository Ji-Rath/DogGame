/// @description Insert description here
// You can write your code in this editor

draw_self();

//Draw alert sign if in alert state
if(State = estates.Alert)
{
	draw_sprite(sAlert,0,x,y-100);
}
