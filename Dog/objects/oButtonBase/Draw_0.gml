/// @description Draw icon

if (!variable_instance_exists(self, "IsHovering")) exit;

if(IsHovering)
	AnimScale *= 1.25;

if(in_sequence)
	draw_self();
else
	//Draw icon
	scrAnimDraw();

if(IsHovering)
    AnimScale /= 1.25;