/// @description Insert description here
// You can write your code in this editor

event_inherited();

//Assigning sprites to variables
SWalk = sOldManWalk;
SWalkUp = sOldManWalk;
SWalkDown = sOldManWalk;
SRun = sOldManWalk;
SRunUp = sOldManWalk;
SRunDown = sOldManWalk;
SIdle = sOldMan;
SIdleUp = sOldMan;
SIdleDown = sOldMan;

WalkSpeed = 3; //NPC walk speed
Scale = 2; //Sprite scaling
AlertDistance = 300; //Distance for seeing the player and starting the cutscene

//Interact text (Documentation can be found on github wiki)
TextArray = [
    ["Yo Man hows it going?",sEnemyalert,0],
    ["Its going pretty sicko mode, how about you?",sDogFace,1],
    ["Meh",sEnemyalert,1],
    ["Ive had better days",sEnemyalert,2]
]

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
    [scrCutSceneTextBox, [["Hey, where did you come from? There are some wicked crabs around",sOldMan,0]]],
    [scrCutSceneEmote, Player, sAlert],
    [scrCutSceneWait, 0.5],
    [scrCutSceneTextBox, [["Dont worry, I was born to fight them",sDogFace,2],["Dont say I didnt warn ya",sOldMan,0]]],
    [scrCutSceneFinish]
];

/////////////////////////////////////////////////////////////////////////////////////

//Whether the player has already encountered the NPC
Used = false;

//Scale the sprite accordingly
image_xscale = Scale;
image_yscale = Scale;

//Used to track path speed
XPrevious = 0;
YPrevious = 0;

Speed = WalkSpeed;