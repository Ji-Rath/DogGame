/// @description Insert description here
// You can write your code in this editor
event_inherited();

//general variable


//textbox variables
Voice				= sndSelect;
Font				= fnt_dialogue;
Name				= "Your Friend";

//dialogue
Text = [];
TextExt = []
TextInitialVal = []
Line = 0;

Text[Line] = "test";
TextInitialVal[Line] = new TextInit(0.05, c_black, 0, oDog);
TextExt[Line] = []

// cutscene - put this in so the game doesnt crash when exiting a room
Used = false;