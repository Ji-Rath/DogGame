/// @description Insert description here
// You can write your code in this editor

if(!oBattleManager.DrawGUI)
	AnimAlpha = oBattleManager.Alpha;

if(IsHovering)
	AnimScale *= 1.25;

if(in_sequence)
	draw_self();
else
	//Draw icon
	scrAnimDraw();

if(IsHovering)
    AnimScale /= 1.25;