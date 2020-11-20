/// @description Insert description here

//Default values
Voice				= sndVoice_01;
Font				= "fnt_dialogue";
Name				= "???";

Sequence = seqTextIntro;

//Textbox variables
PausePunctuation = true;
PunctuationDelay = 0.5; // seconds

// Default values for each text line
CurrentLineInit = new TextInit();

//////////////////////////////////////////////////////////////////////////////////////////////////

/// @func TextInit(TextSpeed = 0.05, TextColor = c_black, TextCloseTime = 0);
/// @desc Struct for storing initial textbox line values
/// @arg TextSpeed=0.25
/// @arg TextColor=c_black
/// @arg TextCloseTime=0
function TextInit() constructor
{
	var TextSpeed = argument_count > 0 ? argument[0] : 0.3;
	var TextColor = argument_count > 1 ? argument[1] : c_black;
	var TextCloseTime = argument_count > 2 ? argument[2] : 0;

	Speed = TextSpeed;
	Color = TextColor;
	CloseTime = TextCloseTime;
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
	var CurrentFont = CurrentSpeaker.Font;
	CurrentCloseTime = CurrentLineInit.CloseTime; //Store auto closing time
	
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

/// @desc Set initial values for line of text
function SetInit(InitArray)
{
	// Assign init text values based on argument count
	switch (array_length(InitArray))
	{
		case 0:
			CurrentLineInit = new TextInit();
			break;
		case 1:
			CurrentLineInit = new TextInit(InitArray[0]);
			break;
		case 2:
			CurrentLineInit = new TextInit(InitArray[0], InitArray[1]);
			break;
		case 3:
			CurrentLineInit = new TextInit(InitArray[0], InitArray[1], InitArray[2]);
			break;
	}
}

/// @desc Attempt to display next line of text, end text event if reached the end
function TryNextLine()
{
	/**
	 * Go to the next page of text if available
	 * If the line of text is finished, go to the next line
	 * If there is no more text available, remove the textbox from the screen
	 */
	var CurrentPage = scribble_page_get(CurrentText);
	if (CurrentPage < scribble_page_count(CurrentText)-1)
	{
		scribble_page_set(CurrentText, CurrentPage+1);
	}
	else if (chatterbox_is_waiting(chatterbox))
	{
		chatterbox_continue(chatterbox);
		bDisplayOptions = false;
	
		if (chatterbox_is_stopped(chatterbox))
		{
			layer_sequence_play(Seq);
		}
		
		InitLine();
	}
	else if (chatterbox_get_option_count(chatterbox) > 0)
	{
		// Once options are displayed, interacting again will choose the selected option
		if (bDisplayOptions)
		{
			chatterbox_select(chatterbox, SelectedOption);
			InitLine();
		}
		
		bDisplayOptions = !bDisplayOptions;
	}
}

//Variables for handling options in text
bDisplayOptions = false;
SelectedOption = 0;

// Scribble text setup
scribble_set_wrap(600, 150);
if (PausePunctuation)
{
	var Delay = PunctuationDelay * 750;
	scribble_add_autotype_character_delay(".", Delay);
	scribble_add_autotype_character_delay(",", Delay);
	scribble_add_autotype_character_delay("!", Delay);
	scribble_add_autotype_character_delay("?", Delay);
}

// Post create event
alarm[0] = 1;
