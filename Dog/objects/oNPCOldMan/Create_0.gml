/// @description Insert description here
// You can write your code in this editor

event_inherited();

WalkSpeed = 3;
Speed = WalkSpeed;

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

//Interact text
Text = [
    ["Yo Man hows it going?",sEnemyalert,0],
    ["Its going pretty sicko mode, how about you?",sDogpaddlerface,1],
    ["Meh",sEnemyalert,1],
    ["Ive had better days",sEnemyalert,2]
]

//Get player
var Player = instance_find(oDogPaddler,0);

//CutScene to warn the player of crabs
CSWarning =
[
    [scrCutSceneCamera, id],
    [scrCutSceneEmote, id, sAlert],
    [scrCutSceneWait, 0.5],
    [scrCutSceneMoveToObject, id, Speed, Player, 100],
    [scrCutSceneCamera, Player],
    [scrCutSceneWait, 0.5],
    [scrCutSceneTextBox, [["Hey, where did you come from? There are some wicked crabs around",sOldMan,0]]],
    [scrCutSceneEmote, Player, sAlert],
    [scrCutSceneWait, 0.5],
    [scrCutSceneTextBox, [["Dont worry, I was born to fight them",sDogpaddlerface,2],["Dont say I didnt warn ya",sOldMan,0]]],
    [scrCutSceneFinish]
];

//Whether the player has already encountered the NPC
Used = false;

//Scale the sprite accordingly
Scale = 2;
image_xscale = Scale;
image_yscale = Scale;

//Used to track path speed
XPrevious = 0;
YPrevious = 0;