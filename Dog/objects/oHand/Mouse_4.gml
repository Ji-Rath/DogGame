/// @description Insert description here
// You can write your code in this editor

if (!bGrabbed)
{
	physics_joint_rope_create(self, oPhysicsMouse, mouse_x, mouse_y,oPhysicsMouse.x,oPhysicsMouse.y, 5, false);
	bGrabbed = true;
	
	for(var i=0;i<array_length(RestingBox);i++)
	{
		instance_destroy(RestingBox[i]);
	}
}
