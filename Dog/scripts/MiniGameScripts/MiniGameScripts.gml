// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function scrRunSequence(Sequence)
{
	var Layer = argument_count > 1 ? argument[1] : "GUI";
	if(is_string(Sequence))
		Sequence = asset_get_index(Sequence);
	
	var AnimSeq = Sequence;
	
	if(layer_exists(Layer))
		AnimSeq = layer_sequence_create(Layer, view_xport[0]+view_wport[0]/2, view_yport[0]+view_hport[0]/2, Sequence);
	else
		AnimSeq = layer_sequence_create("Instances", view_xport[0]+view_wport[0]/2, view_yport[0]+view_hport[0]/2, Sequence);
		
	return AnimSeq;
}