
/// @func TextArray(Text, TextInitStruct, TextExt)
/// @desc Struct for storing main text, initial values, and special commands for textbox
/// @arg Text {array}
/// @arg TextInit {struct}
/// @arg TextExt {array}
function TextEvent() constructor
{
    var TextArray = argument[0];
	var TextInitVal = argument_count > 1 ? argument[1] : [new TextInit()];
	var TextExtArray = argument_count > 2 ? argument[2] : [];
	
	if(!is_array(TextArray))
        TextArray = array_create(1, TextArray);
        
    if(!is_array(TextInitVal))
        TextInitVal = array_create(array_length(TextArray), TextInitVal);
        
    if(!is_array(TextExtArray))
        TextExtArray = array_create(array_length(TextArray), TextExtArray);
	
	Text = TextArray;
	TextInitialVal = TextInitVal;
	TextExt = TextExtArray;
}

/// @func TextInit(TextSpeed, TextColor, TextCloseTime, TextSpeaker)
/// @desc Struct for storing initial textbox line values
/// @arg TextSpeed=0.05
/// @arg TextColor=c_black
/// @arg TextCloseTime=0
/// @arg TextSpeaker=oBattleTextBox
function TextInit() constructor
{
	var TextSpeed = argument_count > 0 ? argument[0] : 0.05;
	var TextColor = argument_count > 1 ? argument[1] : c_black;
	var TextCloseTime = argument_count > 2 ? argument[2] : 0;
	var TextSpeaker = argument_count > 3 ? argument[3] : oTextBox;
	
	Speaker = TextSpeaker;
	Speed = TextSpeed;
	Color = TextColor;
	CloseTime = TextCloseTime;
}

/// @func CreateBattleTextEvent(Text, TextInitialVal = new TextInit(), TextExt = [])
/// @desc Create textbox for the main scene
/// @arg {array} Text
/// @arg {struct} TextInitialVal
/// @arg {array} TextExt
function CreateTextEvent()
{
    var Text = argument[0];
	var TextInitialVal = argument_count > 1 ? argument[1] : [new TextInit()];
	var TextExt = argument_count > 2 ? argument[2] : [];
	
	if(!layer_exists(layer_get_id("TextBox"))) {show_debug_message("No TextBox layer found in room!"); return;}
	
	if(!instance_exists(oTextBox))
	    {
		var TextInst = instance_create_layer(view_xport[0], view_yport[0], "TextBox", oTextBox);
		with(TextInst)
		{
			TextBox = new TextEvent(Text, TextInitialVal, TextExt);
			Sequence = seqTextIntro;
			event_perform(ev_other, ev_user0);
			InitLine(0);
			alarm_set(0, 1*30); //Initial text delay
		}
    }
}

/// @func CreateBattleTextEvent(Text, EndsTurn = false, TextInitialVal = new TextInit(), TextExt = [])
/// @desc Create textbox for the battle scene
/// @arg {array} Text
/// @arg {bool} EndsTurn=false
/// @arg {struct} TextInitialVal
/// @arg {array} TextExt
function CreateBattleTextEvent()
{
    var Text = argument[0];
	var EndsTurn = argument_count > 1 ? argument[1] : false;
	var TextInitialVal = argument_count > 2 ? argument[2] : new TextInit();
	var TextExt = argument_count > 3 ? argument[3] : [];
    
	if(!layer_exists(layer_get_id("TextBox"))) {show_debug_message("No TextBox layer found in room!"); return;}
	
    if(!instance_exists(oTextBox))
    {
        var TextInst = instance_create_layer(0, -1000, "TextBox", oTextBox);
    	with(TextInst)
    	{
    		TextBox = new TextEvent(Text, TextInitialVal, TextExt);
    		EndTurn = EndsTurn;
    		Sequence = seqBattleTextIntro;
    		event_perform(ev_other, ev_user0);
			NewLineCutOff = 40;
    		InitLine(0);
    		alarm_set(0, 1*30); //Initial text delay
    	}
    }
}

/// @desc Setup for each text line
/// @arg {int} CurrentLine
function InitLine(LineCurrent)
{
	if(!variable_instance_exists(self, "TextBox")) exit;
	
	CurrentChar = 0; //Store current character position
	CurrentLine = LineCurrent; //Store current line
	CurrentLineInit = TextBox.TextInitialVal[CurrentLine]; //Initial values struct
	CurrentText = scribble_draw(0, 0, TextBox.Text[CurrentLine]); //Store current text
	CurrentTextExt = TextBox.TextExt[CurrentLine]; //Store current Text Extended
	TextLen = string_length(TextBox.Text[CurrentLine]); //Get total length of text
	DrawnText = "";
	bCompletedCommand = array_create(array_length(TextBox.TextExt[CurrentLine]), false); //Internal boolean to prevent repeated commands
	
	CharSpeed = CurrentLineInit.Speed; //Store initial character speed
	CurrentSpeaker = CurrentLineInit.Speaker; //Store current speaker
	CurrentColor = CurrentLineInit.Color; //Store initial color
	CurrentCloseTime = CurrentLineInit.CloseTime; //Store auto closing time
	CurrentFont = CurrentSpeaker.Font;
	
	scribble_set_wrap(300, 200);
	scribble_autotype_fade_in(CurrentText, 0.3, 0, false);
	scribble_autotype_set_sound_per_char(CurrentText, CurrentSpeaker.Voice, 0.9, 1.1);
	
	alarm_set(0, CharSpeed*30);
	alarm_set(1, -1);
}