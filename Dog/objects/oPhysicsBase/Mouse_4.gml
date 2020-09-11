
var CanGrab = true;
with(oPhysicsBase)
{
	if (Grabbed)
		CanGrab = false;
}

if (CanGrab)
	Grabbed = true;
