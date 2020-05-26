 /// @description Insert description here
// You can write your code in this editor






if (instance_exists(oPlayer))
{
	
	parrysparkcount += 1;
	
	if (parrysparkcount = 1)
	{
		audio_play_sound(sfx,501,false);
		audio_sound_gain(sfx,0.25,0)
		
	}

	if (player.state = states.Playerparry) 
	{
		

		

	
	
	}
	if(parrysparkcount < 6)
	{
	sprite_index = sParryspark;

	image_index = 0;
			
	}
	else if (parrysparkcount < (2*19)+4)
	{
		sprite_index = sParryspark;
		
		if (parrysparkcount = 7) and (instance_number(oHeal)<3)
		{
			instance_create_layer(x,y,"parryspark",oHeal);
			
		}
	
	
	}
	else if (parrysparkcount < (2*19)+11)
	{
		sprite_index = sBlank;
		
	}
	else
	{
		
		instance_destroy();
		
	}
}