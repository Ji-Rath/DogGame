
var CanGrab = true;
with(oPhysicsBase)
{
	if (Grabbed)
		CanGrab = false;
}

if (CanGrab)
{
	Joint = physics_joint_rope_create(self, oPhysicsMouse, mouse_x, mouse_y, oPhysicsMouse.x, oPhysicsMouse.y, 5, false);
	Grabbed = true;
}
