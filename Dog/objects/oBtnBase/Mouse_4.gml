/// @description Insert description here
// You can write your code in this editor

if(Fade)
{
	scrFadeout(TargetRoom, seqCircleTransition);
}
else
{
	room_goto(TargetRoom);
}