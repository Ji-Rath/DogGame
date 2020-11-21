/// @description Insert description here
// You can write your code in this editor

event_inherited();

WalkSpeed = 3; //NPC walk speed
Scale = .5; //Sprite scaling
//AlertDistance = 300; //Distance for seeing the player and starting the cutscene

//Get player reference for use in cutscene
// var Player = instance_find(oDog, 0);

//CutScene to warn the player of crabs (Documentation can be found on github wiki)
// CSWarning =
//[
  //  [scrCutSceneCamera, self],
    //[scrCutSceneEmote, self, sAlert],
    //[scrCutSceneWait, 0.5],
    //[scrCutSceneMoveToObject, self, WalkSpeed, Player, 100],
    //[scrCutSceneCamera, Player],
    //[scrCutSceneWait, 0.5],
    //[scrCutSceneTextBox, ["Hey, where did you come from? There are some wicked crabs around"]],
    //[scrCutSceneEmote, Player, sAlert],
    //[scrCutSceneWait, 0.5],
    //[scrCutSceneTextBox, ["Dont worry, I was born to fight them","Dont say I didnt warn ya"]],
    //[scrCutSceneFinish]
//];

/////////////////////////////////////////////////////////////////////////////////////

//Whether the player has already encountered the NPC
Used = false;

//Scale the sprite accordingly
image_xscale = Scale;
image_yscale = Scale;

Speed = WalkSpeed;