/// @description Insert description here
// You can write your code in this editor
if (game.juststarted != true)
{
	instance_destroy();
	
}

/*
if (discovered = false)
{
var playerdist = point_distance(x,y,oPlayer.x,oPlayer.y);

	if (playerdist < 450)
	{
		discovered = true;
		//oPlayer.inputstop = true;
		oPlayer.incsec = 2;
		
		if (mytextline = noone)
		{
			instance_create_layer(x,y,"mob",oFlower)
		}
	}
}