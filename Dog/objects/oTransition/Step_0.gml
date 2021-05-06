/// @description Insert description here
// You can write your code in this editor

if (SequenceInstance != noone)
{
	var SeqDir = layer_sequence_get_headdir(SequenceInstance);
	if (layer_sequence_is_finished(SequenceInstance))
	{
		if (SeqDir == 1)
		{
			// When sequence finishes, sync player pos and go to next room
			room_goto(RoomTarget);
		}
		else if (SeqDir == -1)
		{
			// When transition is finished, destroy self
			layer_sequence_destroy(SequenceInstance);
			instance_destroy();	
		}
	}
}