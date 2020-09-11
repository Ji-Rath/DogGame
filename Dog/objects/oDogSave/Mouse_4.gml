/// @description Insert description here
// You can write your code in this editor

var Grabbable = true;
with(oPhysicsBase)
{
	if (Grabbed)
		Grabbable = false;
}

if (CanGrab && Grabbable)
	Grabbed = true;