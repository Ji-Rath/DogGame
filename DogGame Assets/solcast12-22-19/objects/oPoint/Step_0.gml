/// @description Insert description here
// You can write your code in this editor
if (x < 0)  x = room_width;

if (x > room_width)  x = 0;

movement_collision();
vsp += grv;
hsp *= movefriction;