/// @description NextCharacterTimer

// Set timer based on character speed
alarm_set(0, CharSpeed*60);

// Do specific actions based on the character to be drawn
if(CurrentChar < string_length(DrawnText))
{
	var CurrentCharacter = string_char_at(DrawnText, CurrentChar+1);
	switch(CurrentCharacter)
	{
		case " ": CurrentChar ++; break;
		case ".":
		case "?":
		case "!":
		case ",":
			if(PausePunctuation)
				alarm_set(0, PunctuationDelay*60);
			break;
	}
	
	audio_play_sound(CurrentSpeaker.Voice, 0, false);
	CurrentChar ++;
}
else if(alarm_get(1) == -1 && CurrentCloseTime != 0)
{
	// Close the text box automatically if enabled
	alarm[1] = CurrentCloseTime*60;
}
