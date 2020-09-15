/// @description Insert description here
// You can write your code in this editor

event_inherited();

WalkSpeed = 3; //NPC walk speed
Scale = 2; //Sprite scaling
AlertDistance = 300; //Distance for seeing the player and starting the cutscene

//Textbox variables
Voice				= sndSelect;
Font				= fnt_dialogue;
Name				= "OldMan";

//Interact text (Documentation can be found on github wiki)
Text = [];
TextExt = []
TextInitialVal = []
Line = 0;

Text[Line] = "Yo Man hows it going?";
TextInitialVal[Line] = new TextInit(0.05, c_black, 0, oOldMan);
TextExt[Line] = []

Line++;
Text[Line] = "Its going pretty sicko mode, how about you?";
TextInitialVal[Line] = new TextInit(0.05, c_black, 0, oDog);
TextExt[Line] = []

Line++;
Text[Line] = "Meh...Ive had better days";
TextInitialVal[Line] = new TextInit(0.05, c_black, 0, oOldMan);
TextExt[Line] = []

//Get player reference for use in cutscene
var Player = instance_find(oDog, 0);

//CutScene to warn the player of crabs (Documentation can be found on github wiki)
CSWarning =
[
    [scrCutSceneCamera, self],
    [scrCutSceneEmote, self, sAlert],
    [scrCutSceneWait, 0.5],
    [scrCutSceneMoveToObject, self, WalkSpeed, Player, 100],
    [scrCutSceneCamera, Player],
    [scrCutSceneWait, 0.5],
    [scrCutSceneTextBox, ["Hey, where did you come from? There are some wicked crabs around"]],
    [scrCutSceneEmote, Player, sAlert],
    [scrCutSceneWait, 0.5],
    [scrCutSceneTextBox, ["Dont worry, I was born to fight them","Dont say I didnt warn ya"]],
    [scrCutSceneFinish]
];

/////////////////////////////////////////////////////////////////////////////////////

//Whether the player has already encountered the NPC
Used = false;

//Scale the sprite accordingly
image_xscale = Scale;
image_yscale = Scale;

Speed = WalkSpeed;