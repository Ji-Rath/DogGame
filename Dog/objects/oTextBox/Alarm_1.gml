/// @description AutoCloseTimer

//Go to next line or fade out
if(CurrentLine < array_length(TextBox.Text)-1)
{
	InitLine(++CurrentLine);
}
else
{
	layer_sequence_play(Seq);
}