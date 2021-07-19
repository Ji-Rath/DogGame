/// @description Insert description here

event_perform(ev_other, ev_user0); //Define instance functions

//Default values
Voice				= sndVoice_01;
Font				= "fnt_dialogue";
Name				= "???";
SpriteList			= [];
SpriteIndex			= 0;

Sequence = seqTextIntro;

//Textbox variables
PausePunctuation = true;
PunctuationDelay = 0.4; // seconds

// Default values for each text line
CurrentLineInit = new TextInit();

//////////////////////////////////////////////////////////////////////////////////////////////////

//Variables for handling options in text
bDisplayOptions = false;
SelectedOption = 0;

// Scribble text setup
scribble_set_wrap(600, 150);
if (PausePunctuation)
{
	var Delay = PunctuationDelay * 750;
	scribble_add_autotype_character_delay(".", Delay);
	scribble_add_autotype_character_delay(",", Delay);
	scribble_add_autotype_character_delay("!", Delay);
	scribble_add_autotype_character_delay("?", Delay);
}

// Post create event
alarm[0] = 1;

CurrentSprIndex = 0;