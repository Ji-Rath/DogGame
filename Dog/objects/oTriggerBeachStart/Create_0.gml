event_inherited();

CutScene = //A group of scenes
[
    [scrCutScenePath, instance_find(oDogPaddler,0), pathBeachStart, 3],
    [scrCutSceneWait, 1],
    [scrCutSceneTextBox, [["What a beautiful day it is outside",sDogpaddlerface,0],["I hope there are no crabs nearby",sDogpaddlerface,1]]],
    [scrCutSceneFinish]
];

OnlyUse = true;