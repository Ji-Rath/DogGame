/// @description Insert description here
// You can write your code in this editor
event_inherited();

var distflw = point_distance(x,y,oPlayer.x,oPlayer.y)

if (abs(distflw > 2000))
{
	with(oPlayer)
	{
		
		if (place_meeting(x,y+3,oWall))
		{
		
			other.state = party1states.reposition;
		}
	}
}

