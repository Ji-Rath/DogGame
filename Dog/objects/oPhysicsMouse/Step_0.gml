/// @description Insert description here
// You can write your code in this editor

phy_position_x = mouse_x;
phy_position_y = mouse_y;

physics_apply_impulse(x, y, mouse_x-x, mouse_y-y);