/// @description Insert description here
// You can write your code in this editor

event_inherited();

WalkSpeed = 3;
Speed = WalkSpeed;
HSpeed = 0;
VSpeed = 0;

//Start path
path_start(pathOldMan,Speed,path_action_restart,false);

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

Text = ["Yo Man hows it going?","Its going pretty sicko mode, how about you?","Meh","Ive had better days"];
Face = [sEnemyalert,sDogpaddlerface,sEnemyalert,sEnemyup];
FaceIndex = [0,1,0,0];

var Player = instance_find(oDogPaddler,0);
CSWarning = //A group of scenes
[
    [scrCutSceneEmote, id, sAlert],
    [scrCutSceneWait, 0.5],
    [scrCutSceneCamera, id],
    [scrCutSceneMoveToObject, id, Speed, Player, 100],
    [scrCutSceneCamera, Player],
    [scrCutSceneWait, 0.5],
    [scrCutSceneTextBox, ["Hey, where did you come from? There are some sicko mode crabs around"],[sOldMan],[0]],
    [scrCutSceneEmote, Player, sAlert],
    [scrCutSceneWait, 0.5],
    [scrCutSceneTextBox, ["Dont worry, I was born to fight them", "Dont say I didnt warn ya"],[sDogpaddlerface, sOldMan],[2,0]],
    [scrCutSceneFinish]
];

Used = false;

Scale = 2;
image_xscale = Scale;
image_yscale = Scale;