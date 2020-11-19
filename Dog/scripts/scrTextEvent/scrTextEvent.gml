
/// @func TextInit(TextSpeed = 0.05, TextColor = c_black, TextCloseTime = 0);
/// @desc Struct for storing initial textbox line values
/// @arg TextSpeed=0.25
/// @arg TextColor=c_black
/// @arg TextCloseTime=0
function TextInit() constructor
{
	var TextSpeed = argument_count > 0 ? argument[0] : 0.25;
	var TextColor = argument_count > 1 ? argument[1] : c_black;
	var TextCloseTime = argument_count > 2 ? argument[2] : 0;

	Speed = TextSpeed;
	Color = TextColor;
	CloseTime = TextCloseTime;
}

/// @func CreateTextEvent(filename, node)
/// @desc Create textbox for the main scene
/// @arg {string} filename
/// @arg {string} node
function CreateTextEvent(filename, node)
{
	if(!layer_exists(layer_get_id("TextBox"))) {show_debug_message("No TextBox layer found in room!"); return;}

	if(!instance_exists(oTextBox))
	{
		var TextInst = instance_create_layer(-2000, -2000, "TextBox", oTextBox);
		with(TextInst)
		{
			// Initialize chatterbox file, nodes, and custom functions
			chatterbox_add_function("SetInit", SetInit);
			if (!chatterbox_is_loaded(filename))
				chatterbox_load(filename);

			chatterbox = chatterbox_create(filename);
			chatterbox_goto(chatterbox, node);

			event_perform(ev_other, ev_user0);
		}
    }
}

/// @func CreateBattleTextEvent(filename, node, EndsTurn = false)
/// @desc Create textbox for the battle scene
/// @arg {string} filename
/// @arg {string} node
/// @arg {bool} EndsTurn=false
function CreateBattleTextEvent(filename, node)
{
	var EndsTurn = argument_count > 2 ? argument[2] : false;

	if(!layer_exists(layer_get_id("TextBox"))) {show_debug_message("No TextBox layer found in room!"); return;}

    if(!instance_exists(oTextBox))
    {
        var TextInst = instance_create_layer(0, -1000, "TextBox", oTextBox);
    	with(TextInst)
    	{
			// Initialize chatterbox file, nodes, and custom functions
			chatterbox_add_function("SetInit", SetInit);
			if (!chatterbox_is_loaded(filename))
				chatterbox_load(filename);

			chatterbox = chatterbox_create(filename);
			chatterbox_goto(chatterbox, node);

    		EndTurn = EndsTurn;
    		Sequence = seqBattleTextIntro;
    		event_perform(ev_other, ev_user0);
    	}
    }
}

/// @desc Setup for each text line
function InitLine()
{
	if (chatterbox_get_content(chatterbox, 0) == undefined) { return; }

	var DrawnText = chatterbox_get_content(chatterbox, 0);
	
	// Set initial values for text
	var CharSpeed = CurrentLineInit.Speed; //Store initial character speed
	var CurrentSpeaker = GetSpeaker(DrawnText);
	var CurrentColor = CurrentLineInit.Color; //Store initial color
	var CurrentCloseTime = CurrentLineInit.CloseTime; //Store auto closing time
	var CurrentFont = CurrentSpeaker.Font;
	
	// Remove name from dialogue
	var ColonPos = string_pos(":", DrawnText);
	DrawnText = string_delete(DrawnText, 0+1, ColonPos+1);
	
	scribble_set_starting_format(CurrentFont, CurrentColor, fa_left);
	scribble_autotype_fade_in(DrawnText, CharSpeed, 0, false);
	scribble_autotype_set_sound_per_char(DrawnText, CurrentSpeaker.Voice, 0.8, 1);
	
	CurrentText = scribble_draw(0, 0, DrawnText);
	scribble_page_set(CurrentText, 0);
	
	alarm_set(1, -1);
}

/// @desc Get the speaker (instance) of the current line of text
function GetSpeaker(Text)
{
	var NamePosition = string_pos(":", Text);
	var SpeakerName = string_copy(Text, 0, NamePosition-1);
	var Speaker = self;

	with(oCharacter)
	{
		if (SpeakerName == Name)
			Speaker = self;
	}
	return Speaker;
}
