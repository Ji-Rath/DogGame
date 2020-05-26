/// @description Insert description here
// You can write your code in this editor
if (state = 0)
{
	sprite_index = sStarwhite;
	count = 0;
	aa = noone;
	bb = noone;
	cc = noone;
	
	image_alpha += 0.01;
	
	
}
else if (state = 1)
{
	image_alpha = 0;
	sprite_index = sBlank;
	
	
	if (aa == noone)  aa = instance_create_layer(x,y,"parryspark",oStar);
	if (bb == noone)  bb = instance_create_layer(x,y,"parryspark",oStar);
	if (cc == noone)  cc = instance_create_layer(x,y,"parryspark",oStar);
	
	if (instance_exists(aa) and (instance_exists(bb)))bb.angle = aa.angle + 360;
	if (instance_exists(bb) and (instance_exists(cc)))cc.angle = bb.angle + 360;
	
	if (instance_exists(aa))  aa.follow = id;
	if (instance_exists(bb))  bb.follow = id;
	if (instance_exists(cc))  cc.follow = id;



	if (!instance_exists(aa) and !instance_exists(bb) and !instance_exists(cc))
	{
		
		state = 0;
		
	}
	
	
}