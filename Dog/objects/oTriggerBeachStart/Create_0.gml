event_inherited();

CutScene = //A group of scenes
[
    [scrCutScenePath, instance_find(oDogPaddler,0), pathBeachStart, 3],
    [scrCutSceneWait, 1],
    [scrCutSceneTextBox, ["What a beautiful day it is outside", "I hope there are no crabs nearby"], [sDogpaddlerface,sDogpaddlerface], [0,1]],
    [scrCutSceneFinish]
];

OnlyUse = true;