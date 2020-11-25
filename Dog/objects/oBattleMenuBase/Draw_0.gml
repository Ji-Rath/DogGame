/// @description Draw icon

draw_set_alpha(oBattleManager.Alpha);
if(IsHovering)
	AnimScale *= 1.25;

if(in_sequence)
	draw_self();
else
	//Draw icon
	scrAnimDraw();

if(IsHovering)
    AnimScale /= 1.25;
draw_set_alpha(1);