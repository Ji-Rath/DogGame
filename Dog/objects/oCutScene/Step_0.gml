/// @description;

SelectedCutScene = CutScene[CurrentScene]; //Get current array scene

//Execute script based on arguments 
var Length = array_length_1d(SelectedCutScene)-1;
switch(Length)
{
    case 0: script_execute(SelectedCutScene[0]) break;
    case 1: script_execute(SelectedCutScene[0],SelectedCutScene[1]) break;
    case 2: script_execute(SelectedCutScene[0],SelectedCutScene[1],SelectedCutScene[2]) break;
    case 3: script_execute(SelectedCutScene[0],SelectedCutScene[1],SelectedCutScene[2],SelectedCutScene[3]) break;
    case 4: script_execute(SelectedCutScene[0],SelectedCutScene[1],SelectedCutScene[2],SelectedCutScene[3],SelectedCutScene[4]) break;
    case 5: script_execute(SelectedCutScene[0],SelectedCutScene[1],SelectedCutScene[2],SelectedCutScene[3],SelectedCutScene[4],SelectedCutScene[5]) break;
    case 6: script_execute(SelectedCutScene[0],SelectedCutScene[1],SelectedCutScene[2],SelectedCutScene[3],SelectedCutScene[4],SelectedCutScene[5],SelectedCutScene[6]) break;
}