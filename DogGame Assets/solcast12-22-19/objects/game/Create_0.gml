/// @description Insert description here
// You can write your code in this editor
player = noone;
dog = 0;
yam = noone;
statsobj = stats;
lastcheckpoint = noone;

guiWidth = display_get_gui_width();
guiHeight = display_get_height();
blackAlpha = 0;
spawnRoom = -1;
doTransition = false;
spawnx = 1197;
spawny = 1852;


if(room = rm_alpha)
{
	room_goto_next();
	player = instance_create_layer(spawnx,spawny,"player",oPlayer)
}

easefromblack = false;
easefromblack2 = false;
blackAlpha2 = 1;
fadeincount = 0;


juststarted = true;
beginningsleep = true;
cutscene1 = false;
cs1count = 0;


pearlmet = false;
