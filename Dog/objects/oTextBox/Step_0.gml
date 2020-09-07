/// @description Insert description here
// You can write your code in this editor

//If interact key pressed, go to next page, or destroy if empty
if (global.KeyInteract && KeyWait == false)
{
	var CurrentText = TextArray[Page];
	var Text = CurrentText[0];
	if(TextPos == string_length(Text))
	{
		if (Page < array_length_1d(TextArray)-1)
		{
			Page ++;
			TextPos = 0;
		}
		else
		{
			Timer[0] = 0.25*60;
			TextPos = 0;
		}
	}
	else
	{
		TextPos = string_length(Text)
	}
}
else
{
	KeyWait = false
}

if(Timer[0] > 0)
{
	Timer[0] -= 1;
}
else if(Timer[0] != -1)
{
	instance_destroy();
}