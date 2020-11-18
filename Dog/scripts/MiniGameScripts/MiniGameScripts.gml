// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

/// @func scrRunSequence(Sequence, Layer = "GUI", x = view_wport[0]/2, y = view_hport[0]/2);
function scrRunSequence(Sequence)
{
	var Layer = argument_count > 1 ? argument[1] : "GUI";
	var X = argument_count > 2 ? argument[2] : view_wport[0]/2;
	var Y = argument_count > 3 ? argument[3] : view_hport[0]/2;
	if(is_string(Sequence))
		Sequence = asset_get_index(Sequence);
	
	var AnimSeq = Sequence;
	if(layer_exists(Layer))
	{
		AnimSeq = layer_sequence_create(Layer, view_xport[0]+X, view_yport[0]+Y, Sequence);	
	}
	else
	{
		AnimSeq = layer_sequence_create("Instances", view_xport[0]+X, view_yport[0]+Y, Sequence);
	}
	return AnimSeq;
}