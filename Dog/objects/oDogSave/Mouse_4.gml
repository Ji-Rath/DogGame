/// @description Insert description here
// You can write your code in this editor

var Grabbable = true;
with(oPhysicsBase)
{
	if (Grabbed)
		Grabbable = false;
}

if (CanGrab && Grabbable)
{
	Joint = physics_joint_rope_create(self, oPhysicsMouse, mouse_x, mouse_y, oPhysicsMouse.x, oPhysicsMouse.y, 5, false);
	Grabbed = true;
}
	