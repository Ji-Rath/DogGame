/// @description Insert description here
// You can write your code in this editor

XPos = 0;
YPos = 0;
image_speed = 0.1;

/// @desc Calculate the position for each Battle UI
function CalculatePosition()
{
	static Interval = sprite_get_height(SpriteUI)/1.25;
	for	(var i=0;i<instance_number(oBattleCharBase);i++)
	{
		var Inst = instance_find(oBattleCharBase, i);
		with (Inst)
		{
			XPos = 100;
			YPos = 75+(Interval*i);
		}
	}
}