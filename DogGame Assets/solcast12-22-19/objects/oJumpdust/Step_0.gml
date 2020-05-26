/// @description Insert description here
// You can write your code in this editor







if (instance_exists(oPlayer))
{
	x += (player.x - x)/20;
	
	y += (player.y - y)/20;

	image_xscale = player.image_xscale;
	
	count += 1;

	if (count < 2)
	{
		sprite_index = sJumpdust;
		image_index = 0;
		
	}
	else if (count < 2*frames)
	{
		sprite_index = sJumpdust;
		
		
	}
	else
	{
		sprite_index = sBlank;
		instance_destroy();
		player.jumpdust = noone;
		
	}
}
