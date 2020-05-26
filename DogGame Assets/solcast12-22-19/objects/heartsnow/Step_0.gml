/// @description Insert description here
// You can write your code in this editor
part_emitter_region(part_system,part_emitter,VCam.x-1000,VCam.x+1000,VCam.y-500 ,VCam.y+500 ,ps_shape_rectangle,ps_distr_linear)
part_type_speed(part_type,5,10,-0.000000000000001,0)
//part_emitter_burst(part_system,part_emitter,part_type,1);
part_emitter_burst(part_system,part_emitter,part_type,1);