/// @description Insert description here
// You can write your code in this editor


//Default values
Voice				= sndVoice_01;
Font				= fnt_dialogue;
Name				= "???";

Sequence = seqTextIntro;

//Textbox variables
PausePunctuation = true;
PunctuationDelay = 0.5; // seconds

// Initial values for text line
CurrentLineInit = new TextInit();

//////////////////////////////////////////////////////////////////////////////////////////////////

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

/// @desc Returns the value of the variable
function GetVariable(VariableString)
{
	return variable_instance_get(CurrentSpeaker, VariableString);
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
	var Delay = PunctuationDelay * 1000;
	scribble_add_autotype_character_delay(".", Delay);
	scribble_add_autotype_character_delay(",", Delay);
	scribble_add_autotype_character_delay("!", Delay);
	scribble_add_autotype_character_delay("?", Delay);
}
