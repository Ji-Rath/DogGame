/// @description Insert description here

//Inherit parent code
event_inherited();

WalkSpeed = 3; //player walk speed
RunSpeed = WalkSpeed * 1.5; //player run speed
DetectRange = 350; //Range to detect player
BufferDistance = 100; //Additional range to lose aggro on player
Health = 10; //enemy health
Scale = 0.5; //sprite scale
WanderInterval = 3; //Interval (seconds) between wandering positions

//Enemy object when in BattleScene
BattleObject = oCrabBattle;

//Textbox variables
Voice				= sndVoice_01;
Font				= fnt_dialogue;
Name				= "Dogpaddler";
