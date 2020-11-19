/// @description Insert description here
// You can write your code in this editor

if(!variable_instance_exists(self, "Seq")) exit;

//Pause at end of sequence and reverse head direction to prep for fade out textbox
//Destroy textbox if finished with text and fade out has completed
if(layer_sequence_is_finished(Seq) && !layer_sequence_is_paused(Seq))
{
	var CurrentDir = layer_sequence_get_headdir(Seq);
	if (CurrentDir == 1)
	{
		layer_sequence_headdir(Seq, -CurrentDir);
	}
	else
	{
		instance_destroy();
	}
	layer_sequence_pause(Seq);
}

//Go to next line or skip to end of current line
if(global.KeyInteract)
{
	if(scribble_autotype_get(CurrentText) < 1)
	{
		scribble_autotype_skip(CurrentText)
	}
	else if (scribble_autotype_get(CurrentText) == 1 && CurrentLine < array_length(TextBox.Text)-1)
	{
		InitLine(++CurrentLine);
	}
	else
	{
		layer_sequence_play(Seq);
	}
}

//Update position
var Camera = view_camera[0];
var ViewWidthHalf = camera_get_view_width(Camera) * 0.5;
var ViewHeightHalf = camera_get_view_height(Camera) * 0.5;
layer_sequence_x(Seq, camera_get_view_x(Camera)+ViewWidthHalf);
layer_sequence_y(Seq, camera_get_view_y(Camera)+ViewHeightHalf);