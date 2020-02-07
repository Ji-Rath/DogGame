/// @description Insert description here
// You can write your code in this editor
event_inherited();
hsprite = sCrab;
hspritewalk = sCrabWalk;
hspriterun = sCrabRun;
spriteup = sCrab;
spriteupwalk = sCrabWalk;
spriteuprun = sCrabRun;
spritedown = sCrab;
spritedownwalk = sCrabWalk;
spritedownrun = sCrabRun;
spritealert = sCrabAlert;


hp = 10;


if (place_meeting(x,y,oDogPaddler))
{
	oDogPaddler.attacker = oCrab;
}

