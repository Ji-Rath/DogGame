
CutScene = //A group of scenes
[
    [scrCutSceneMove, instance_find(oDogPaddler,0), 3, 2440, 1152, false],
    [scrCutSceneWait, 1],
    [scrCutSceneMove, instance_find(oCrab,0), 3, 2540, 1152, false],
    [scrCutSceneTextBox, ["Hey its a crab", "look ok we get it, u were bullied as a kid, i really dont care"],[sDogpaddlerface,sCrab],[0,0]],
    [scrCutSceneWait, 0.5],
    [scrCutSceneBattle, oCrab],
    [scrCutSceneFinish]
];