/// @description Insert description here
// You can write your code in this editor
parent = noone;
part_system = part_system_create();

part_emitter = part_emitter_create(part_system);

part_type = part_type_create();
part_type_sprite(part_type,sHeal,false,false,false)

part_type_blend(part_type,bm_add)
part_type_alpha3(part_type,0,0.5,0)
part_type_life(part_type,game_get_speed(gamespeed_fps),game_get_speed(gamespeed_fps)*6)
part_type_gravity(part_type,-0.1,90);
part_type_size(part_type,0.05,0.5,0,0)


part_system_depth(part_type,1401)