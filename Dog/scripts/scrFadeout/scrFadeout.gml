/// @func scrFadeout(room, fadecolor, fadespeed)
/// @desc Fade into a different room
/// @arg {room} Room
/// @arg {sequence} IntroSequence
/// @arg {sequence} *OutroSequence
/// @arg {struct} *CharInfo struct
function scrFadeout() {
	var Room = argument[0];
	var IntroSeq = argument[1];
	var OutroSeq = argument_count > 2 ? argument[2] : IntroSeq;
	var PlayerData = argument_count > 3 ? argument[3] : noone;
	
	if(!instance_exists(oTransition))
	{
	    var Fade = instance_create_depth(0,0,0,oTransition);
		with (Fade)
		{
			IntroSequence = IntroSeq;
			OutroSequence = OutroSeq;
		    RoomTarget = Room;
		    if(is_struct(PlayerData))
		    {
		        PlayerInfo = PlayerData;
		    }
		}
	}
}


function CharInfo(_X, _Y, _Sprite, _XScale) constructor
{
	X = _X;
	Y = _Y;
	Sprite = _Sprite;
	XScale = _XScale;
};
