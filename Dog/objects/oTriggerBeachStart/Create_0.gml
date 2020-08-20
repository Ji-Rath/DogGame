event_inherited();

CutScene = //A group of scenes
[
    [scrCutScenePath, instance_find(oDog,0), pathBeachStart, 3],
    [scrCutSceneWait, 1],
    [scrCutSceneTextBox, [["What a beautiful day it is outside",sDogFace,0],["I hope there are no crabs nearby",sDogFace,1]]],
    [scrCutSceneFinish]
];

OnlyUse = true;