/// @description Insert description here
// You can write your code in this editor
var dirtoplayer = sign(player.x - x)
if (dirtoplayer != 0)
{
	image_xscale = dirtoplayer*scale;
	
}
alphamargin = 0.7;
var alphainc = 0.05;


if (alphaset = 1)
{
	if (image_alpha < alphamargin)
	{
	
		image_alpha += alphainc
	
	}
}
else if (alphaset = 2)
{
	if (image_alpha > 0)
	{
	
		image_alpha -= alphainc
	
	}
	
}
if state != predogstates.knockback count = 0;
if state != predogstates.knockout count2 = 0;

if (state == predogstates.pant)
{
	movement_collision()
	
	vsp += grv;
	hsp *= movefriction;
	sprite_index = sPredogPant
	
	
	
	
}
else if (state == predogstates.idle)
{
	movement_collision()
	
	vsp += grv;
	hsp *= movefriction;
	sprite_index = sPredogPant
	image_index = 0;
	
}
else if (state == predogstates.bark)
{
	barkcount += 1;
	movement_collision()
	vsp += grv;
	hsp *= movefriction;
	
	if (barkcount < 2)
	{
		audio_play_sound(barksfx,501,false)
		sprite_index = sPredogbark;
		image_index = 0;
	}
	else if (barkcount < 2* image_number)
	{
		
		
		sprite_index = sPredogbark;
		
	}
	else
	{
		state = predogstates.pant;
		if (barkcount = 30)
		{
			var barkecho = audio_play_sound(barksfx,501,false)
			audio_sound_gain(barkecho,0.5,0)
			
		}
		
	}
	
}
else if (state == predogstates.knockback)
{
	count += 1;
	movement_collision();
	vsp += grv;
	hsp *= movefriction;
	if (count = 1)
	{
		hsp = 30;
		vsp = -20;
		
	}
	if (count = 5)
	{
		audio_play_sound(doghurtsfx,501,false)
		
	}
	sprite_index = sPredogkb;
	if (place_meeting(x,y+3,oWall))
	{
		state = predogstates.knockout
		
	}
	
}
else if (state == predogstates.knockout)
{
	
	
	
	movement_collision();
	vsp += grv;
	hsp*= movefriction;
	
	count2 += 1;
	
	if (count2 = 1)
	{
		audio_play_sound(tumblesfx,501,false)
		hsp = 30;
		
	}

	
	if (count2 < 2)
	{
		sprite_index = sPredogko;
		image_index = 0;
		
	}
	else if (count2 < image_number*2)
	{
		
		
		sprite_index = sPredogko;
		
		
	}
	else
	{
		image_index = image_number-1;
		
	}
	
	
	
}