/// @description Insert description here
// You can write your code in this editor

image_speed = 0;

HoverEnter = TweenCreate("$0.1", "image_scale>", 1.25);
HoverLeave = TweenCreate("$0.1", "image_scale>", 1);

/// @desc Run a sequence that replaces oButtonRage with current object. Also incorporates SpeedMultiplier from oBattleManager
function ButtonSequence(Sequence)
{
	var AnimSeq = layer_sequence_create("GUI", x, y, Sequence);
	var AnimSeqInstance = layer_sequence_get_instance(AnimSeq);
	sequence_instance_override_object(AnimSeqInstance, oButtonRage, self);
	
	if (instance_exists(oBattleManager))
	{
		var SpeedMultiplier = oBattleManager.SpeedMultiplier;
		layer_sequence_speedscale(AnimSeq, SpeedMultiplier);
	}
	
}