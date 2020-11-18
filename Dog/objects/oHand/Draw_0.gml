/// @description Insert description here
// You can write your code in this editor

draw_self();

//used to set the way each individual particle or "water" acts alone
var flags = phy_particle_flag_water | phy_particle_flag_viscous;

//we have to remove that black border, but if we used a normal blend mode to do this
//such as bm_add we are left with a white center and no way to change its color
gpu_set_blendmode_ext(bm_inv_src_alpha, bm_inv_src_color);
//we have to actually draw the particle, if we don't add this the particles are created
//but you can't see them
physics_particle_draw(flags,0,sWater,0);
//reset our blend mode so nothing else is effected by the previous blend mode
gpu_set_blendmode(bm_normal);