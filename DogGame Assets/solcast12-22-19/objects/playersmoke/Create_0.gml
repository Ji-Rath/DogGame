/// @description Insert description here
// You can write your code in this editor
parent = noone;
part_system2 = part_system_create();

part_emitter2 = part_emitter_create(part_system2);

part_type2 = part_type_create();
part_type_sprite(part_type2,sShiniparticle,false,false,false)


part_type_alpha3(part_type2,0.05,0.025,0)
part_type_life(part_type2,game_get_speed(gamespeed_fps),game_get_speed(gamespeed_fps)*5)
part_type_gravity(part_type2,0.01,90);
part_type_size(part_type2,0.05,1.25,0,0)
part_type_color_mix(part_type2,c_dkgray,c_silver)
part_system_depth(part_type2,2701)
