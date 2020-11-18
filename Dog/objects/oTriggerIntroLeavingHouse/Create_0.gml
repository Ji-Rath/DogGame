
Key = room_get_name(room)+"Trigger"+string(x)+string(y);

visible = false;

CutScene = //A group of scenes
[
	[scrCutSceneTextBox, ["and some milk."], [new TextInit(0.05, c_black, 0, oDog)]],
	[scrCutSceneFinish]
];

OnlyUse = true; //Should the trigger only be used once?
Used = false; //Has the trigger been used already?