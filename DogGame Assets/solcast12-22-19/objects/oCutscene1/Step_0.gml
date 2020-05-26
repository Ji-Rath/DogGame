/// @description Insert description here
// You can write your code in this editor
if (state == scene1.dormant)
{
	if (place_meeting(x,y,oPlayer))
	{
		with (oPlayer)
		{
			inputstop = true;
			incsec = 2;
		
		}
		
		if(instance_exists(oSound.musicsnd))
		{
		
			with (oSound)
			{
				audio_stop_sound(musicsnd);
			
			}
		}
		
		
	
		if(oPlayer.state= states.null)
		{
			state = scene1.cut1
		
		
		}
	
	}
}
else if (state == scene1.cut1)
{
	var secs1 = 4;
	var secs2 = 1;
	count += 1;
	/*
	if (count < 2)
	{
		
		predog = instance_create_layer(oPlayer.x-300,oPlayer.y,"dog",oPredog);
		
		
	}
*/
	
	
	
	if (count == secs2 * 60)
	{
		predog = instance_create_layer(oPlayer.x-300,oPlayer.y,"dog",oPredog);
		
	}
	
	if (count == secs1 * 60)
	{
		state = scene1.cut2
		
	}
	
	
}
else if (state = scene1.cut2)
{
	count2 += 1;
	var secs1 = 2;
	
	if (text = noone)
	{
		text = instance_create_layer(x,y,"mob",oMonologue3);
		
	}
	if (count > 2)
	{
		if (!instance_exists(text))
		{
			state = scene1.cut3;
			
		}
		
	}
	
	/*
	var fadeinc = 0.1;
	if (instance_exists(oDreamplatform))
	{
		oDreamplatform.image_alpha -= fadeinc;
		if (oDreamplatform.image_alpha <0.8)
		{
			instance_destroy(dreamcollide);
			oPlayer.state = states.Playernormal;
			
		}
	*/
	
	
	
	
	
	
}
else if (state = scene1.cut3)
{
	count3 += 1;
	
	if (count3 = 100)
	{
		predog.state = predogstates.bark
		
	}
	
	if (count3 > 160)
	{
		state = scene1.cut4;
		predog.alphaset = 2;
		
	}
	
}
else if (state = scene1.cut4)
{
	
	count4 += 1;
	
	if (count4 > 20)
	{
		var fadeinc = 0.1;
		if (instance_exists(oDreamplatform))
		{
			oDreamplatform.image_alpha -= fadeinc;
			if (oDreamplatform.image_alpha <0.8)
			{
				instance_destroy(dreamcollide);
				oPlayer.state = states.Playernormal;
			
			}
		}
	}
	
}


/*
	if (count > 60)
	{
	
		if (predog = noone)
		{
		
			predog = instance_create_layer(oPlayer.x-1000,oPlayer.y,"dog",oPredog)
			predog.state = predogstates.knockback;
			audio_play_sound(hurtsfx,501,false)
		
		
		}
		
		
		if (predog.state = predogstates.knockout)
		{
			count2 += 1;
			
			
			if (count2 > 30)
			{
				if (text == noone)
				{
					text = instance_create_layer(x,y,"mob",oMonologue3)
					
					
				}
				
				
			
			}
			
			
			
			if (count > 80)
			{
				
					
					
			}
			
		
		
		}
	
	}
	
	
	
	