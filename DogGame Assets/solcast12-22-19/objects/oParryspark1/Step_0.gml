/// @description Insert description here
// You can write your code in this editor






if (instance_exists(oPlayer))
{
	
	parrysparkcount += 1;
	if (parrysparkcount = 1)
	{
		audio_play_sound(parrysfx,501,false);
		audio_sound_gain(parrysfx,0.5,0)
		
	}

	if (player.state = states.emptyparry)
	{
		
		if(parrysparkcount < 12)
		{
		sprite_index = sParryspark;

		image_index = 0;
			
		}
		

	
	
	}
	else if (parrysparkcount < (12+(2*image_number))-2)
	{
		sprite_index = sParryspark;
		if (parrysparkcount = 13) and (instance_number(oHeal)<3)
		{
			instance_create_layer(x,y,"parryspark",oHeal);
		}
	
	}

	else
	{
		instance_destroy();
		
	}
}