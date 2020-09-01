event_inherited();

CutScene = //A group of scenes
[
    [scrCutScenePath, instance_find(oDog,0), pathBeachStart, 3],
    [scrCutSceneWait, 1],
    [scrCutSceneTextBox, ["What a beautiful day it is outside","I hope there are no crabs nearby"], [new TextInit(0.05, c_black, 0, oDog), new TextInit(0.05, c_black, 0, oDog)]],
    [scrCutSceneFinish]
];

OnlyUse = true;