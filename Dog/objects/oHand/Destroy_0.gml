/// @description Insert description here
// You can write your code in this editor

/** destroy physics rope arms */
with (oArm)
	instance_destroy();
with (oIce)
	instance_destroy();

/** Destroy any liquid particles */
physics_particle_delete_region_box(room_width/2, room_height/2, 1000, 1000);