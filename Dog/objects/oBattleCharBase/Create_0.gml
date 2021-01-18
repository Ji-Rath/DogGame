/// @description Insert description here
// You can write your code in this editor

image_speed = 0;
image_alpha = 0;
var XOffset = 100;
x = XOffset; //XOffset

/// @desc Calculate the position for each Battle UI
function CalculatePosition()
{
	static Interval = sprite_get_height(sprite_index)/1.25;
	for	(var i=0;i<instance_number(oBattleCharBase);i++)
	{
		var Inst = instance_find(oBattleCharBase, i);
		with (Inst)
		{
			y = 75+(Interval*i);
		}
	}
}

FadeIn = TweenCreate("$0.5", "x", 0, XOffset, "image_alpha>", 1);
FadeOut = TweenCreate("$0.5", "x>", 0, "image_alpha>", 0);