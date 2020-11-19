/// @description Insert description here
// You can write your code in this editor


/// @desc Special modifiers that can change specific characters (See draw event #37)
function SetExt(ExtArray)
{
	CurrentTextExt = ExtArray;
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
	if(chatterbox_is_waiting(chatterbox))
	{
		chatterbox_continue(chatterbox);
		InitLine();
	
		if (chatterbox_is_stopped(chatterbox))
		{
			layer_sequence_play(Seq);
		}
	}	
}

CurrentLineInit = new TextInit();
CurrentTextExt = [];

//Default values
Voice				= sndVoice_01;
Font				= fnt_dialogue;
Name				= "???";
CharSpeed			= 0.05;

Sequence = seqTextIntro;

//Textbox variables
PausePunctuation = true;
PunctuationDelay = 0.5;
NewLineCutOff = 30;