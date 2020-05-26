/// @description Insert description here
// You can write your code in this editor
gpu_set_blendmode(bm_add);
draw_self();

if (instance_exists(loopmarker))
{
	
	var ii = draw_sprite_ext(sprite_index,image_index,x+4000,y,image_xscale,scale,0,c_white,1)
	var jj = draw_sprite_ext(sprite_index,image_index,x-4000,y,image_xscale,scale,0,c_white,1)


}


gpu_set_blendmode(bm_normal);