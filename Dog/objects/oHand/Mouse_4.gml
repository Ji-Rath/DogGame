/// @description Insert description here
// You can write your code in this editor

if (!bGrabbed)
{
	physics_joint_rope_create(self, oPhysicsMouse, phy_position_x,phy_position_y,oPhysicsMouse.x,oPhysicsMouse.y, 5, false);
	phy_fixed_rotation = true;
	bGrabbed = true;
}
