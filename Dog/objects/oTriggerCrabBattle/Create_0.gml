event_inherited();

var Text = "", TextInitial, TextExt = [], Line = 0;

Text[Line] = "Hey its a crab";
TextInitial[Line] = new TextInit(0.05, c_black, 0, oDog);
TextExt[Line] = [];

Line++;
Text[Line] = "%slook ok we get it, u were bullied as a kid, %fi really dont %ccare";
TextInitial[Line] = new TextInit(0.05, c_red, 0, oCrab);
TextExt[Line] = [[show_debug_message, "test!"],0.1, c_green];

CutScene = //A group of scenes
[
    [scrCutSceneMove, instance_find(oDog,0), 3, 2440, 1152, false],
    [scrCutSceneWait, 1],
    [scrCutSceneMove, instance_find(oCrab,0), 3, 2540, 1152, false],
    [scrCutSceneTextBox, Text, TextInitial, TextExt],
    [scrCutSceneWait, 0.5],
    [scrCutSceneBattle, oCrab],
    [scrCutSceneFinish]
];

OnlyUse = true;