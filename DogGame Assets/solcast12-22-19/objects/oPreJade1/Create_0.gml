/// @description Insert description here
// You can write your code in this editor
event_inherited();
//-------DIALOGUE STUFF

myPortrait			= sBlank;
myVoice				= noone//snd_voice1;
myName				= "";
Username = "Melvin"
face = sBlank;


/*
myPortraitTalk		= spr_portrait_examplechar_mouth;
myPortraitTalk_x	= 26;
myPortraitTalk_y	= 44;
myPortraitIdle		= spr_portrait_examplechar_idle;
*/

//-------OTHER

choice_variable		= -1;	//the variable we change depending on the player's choice in dialogue
eventdialogue = 0;

/*

		myText[i]		
		myTextSpeed[i]	
		myEmotion[i]	
		myEmote[i]		
		mySpeaker[i]	
		myTextCol[i]	
		
		*/
		
		
		




hsp = 0;
vsp = 0;
grv = oPlayer.grv;
move = 0;

movefriction = oPlayer.movefriction;
walksp = oPlayer.walksp/6;
enum prejadestates
{
	dormant,
	walk,
	summon,
	throw,
	pull,
	pullflight,
	drop,
	scene1
	
	
	
}

state = prejadestates.scene1;


enum prejanimstates
{
	
	walk,
	startup,
	winddown,
	idle
	
	
}

walkcount = 0;
winddowncount = 0;

animstate = prejanimstates.idle;

startupsprite = sPreJadeStartup;
idlesprite = sPreJade;
winddownsprite = sPreJadeWinddown;
walksprite = sPreJadeWalk;
text = noone;

count = 0;

scale = 1;
image_xscale = scale;
image_yscale = scale;