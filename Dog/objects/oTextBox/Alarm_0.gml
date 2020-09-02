/// @description NextCharacterTimer

alarm_set(0, CharSpeed*60);

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
	bCompletedCommand = array_create(array_length(TextBox.TextExt[CurrentLine]), false);
}
else if(alarm_get(1) == -1 && CurrentCloseTime != 0)
{
	alarm[1] = CurrentCloseTime*60;
}
