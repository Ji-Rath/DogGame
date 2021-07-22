/// @description Insert description here
// You can write your code in this editor

RoomTarget = rmTitle;
IntroSequence = seqCircleTransition;
OutroSequence = seqCircleTransition;
SequenceInstance = noone;

PlayerInfo = noone;

function SyncVariables()
{
	if (is_struct(PlayerInfo))
	{
		if (instance_exists(oDog))
		{
			oDog.x = PlayerInfo.X;
			oDog.y = PlayerInfo.Y;
			oDog.sprite_index = PlayerInfo.Sprite;
			oDog.image_xscale = PlayerInfo.XScale;
			oCamera.SnapCamera(PlayerInfo.X, PlayerInfo.Y); //Snap camera again to prevent graphical glitches
		}
		with (oPartnerBase)
		{
			x = other.PlayerInfo.X;
			y = other.PlayerInfo.Y;
		}
	}
}

/// @desc Create GUI sequence
/// @arg Sequence The sequence to play
/// @arg HeadDir=1 The direction of the sequence
function CreateSequence(Sequence, HeadDir = 1)
{
	show_debug_message("SEQUENCE: "+string(Sequence));
	if (!sequence_exists(Sequence)) { return; } 
	var _vx = camera_get_view_x(view_camera[0]);
	var _vy = camera_get_view_y(view_camera[0]);
	SequenceInstance = layer_sequence_create(layer_get_id("GUI"), _vx + view_wport[0]/2, _vy + view_hport[0]/2, Sequence);
	if (HeadDir == -1)
	{
		var SeqLength = layer_sequence_get_length(SequenceInstance);
		layer_sequence_headpos(SequenceInstance, SeqLength);
		layer_sequence_headdir(SequenceInstance, -1);
	}
}

alarm[0] = 1;