
Key = room_get_name(room)+"Trigger"+string(x)+string(y);

visible = false;

CutScene = //A group of scenes
[
	[scrCutSceneWait, 1],
	[scrCutSceneTextBox, TextFile, TextNode],
	[scrCutSceneFinish]
];

OnlyUse = true; //Should the trigger only be used once?
Used = false; //Has the trigger been used already?