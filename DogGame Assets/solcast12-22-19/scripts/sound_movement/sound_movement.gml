	if (game.juststarted = true)
	{
		
		startupsprite = sPlayerStartup1;
		runsprite = sPlayerRun1;
		winddownsprite = sPlayerWinddown1;
		
		
	}
	else
	{
		startupsprite = sPlayerStartup;
		runsprite = sPlayerRun;
		winddownsprite = sPlayerWinddown;
		
		
	}
	
	
	
	
	
	if (place_meeting(x,y,oHardfloor))
	{
	
		runsnd = runningsfx;
		
	
		landsnd = landsfx;
		tumblesnd = choose(tumblesfx)
	}
	else if (place_meeting(x,y,oWoodfloor))
	{
		runsnd = runningwoodsfx;
		
	
		landsnd = landsfx;
		tumblesnd = choose(tumblesfx)
		
	}
	else
	{
		
		runsnd = runninggrasssfx;
	
	
		landsnd = landsfx1;
		tumblesnd = choose(tumblesfx1)
		
	}
	jumpsnd = choose(jumpsfx);
	
	


if (place_meeting(x,y+3,oWall))
{
	jumpplaysound = noone;
	
	if (move != 0)
	{
		
		
		winddownplaysound = noone;
		
		if (winddownanim != 1) or (rollanim != 1)
		{
			if (sprite_index = startupsprite)
			{
				if (image_index = 11)
				{
					audio_sound_pitch(runsnd,choose(0.8,1,1.3))
					audio_play_sound(runsnd,501,false)
					
				}
				
			}
			if (sprite_index = runsprite)
			{
				if (image_index = 5) or (image_index = 15)
				{
					audio_sound_pitch(runsnd,choose(0.8,1,1.3))
					audio_play_sound(runsnd,501,false)
					
					
				}
				
				
			}
			
			
			
		}
		
		
		
		if (rollanim = 1)
		{
			runplaysound = noone
			if (tumbleplay = noone)
			{
				audio_sound_pitch(tumblesnd,choose(0.5,0.8,1.0,1.2))
				tumbleplay = audio_play_sound(tumblesnd,501,false)
				audio_sound_gain(tumblesnd,1,0);
				
				
			}
			
		}
		else
		{
			tumbleplay = noone;
		}
		
	}
	else
	{
		runplaysound = noone;
		
		if (landanim = 1)
		{
			if (landplay = noone)
			{
				audio_sound_pitch(landsnd,choose(0.8,1.0,1.2))
				landplay = audio_play_sound(landsnd,501,false)
				
				
				
			}
			
		}
		
		
		
		
		
		if (winddownanim = 1)
		{
			
			runplaysound = noone;
			
			if (sprite_index = winddownsprite)
			{
				if (image_index = 1) or (image_index = 9)  or (image_index = 21) or (image_index = 32) or (image_index = 44) 
				{
					
					audio_sound_pitch(runsnd,choose(0.5,0.8,1,1.3))
					audio_play_sound(runsnd,501,false)
					
					
					
					
				}
			}
			
		}
		if (rollanim = 1)
		{
			audio_sound_pitch(tumblesnd,choose(0.8,1.0,1.2))
			if (tumbleplay = noone)
			{
				tumbleplay = audio_play_sound(tumblesnd,501,false)
				audio_sound_gain(tumblesnd,1,0);
				
				
			}
		}
		else
		{
			tumbleplay = noone;
		}
		
		
		
	}
}
else
{
	landplay = noone;
	
	runplaysound = noone;
	winddownplaysound = noone;
	if (vsp < 0)
	{
		if (jumpplaysound == noone)
		{
			audio_sound_pitch(jumpsnd,choose(0.8,1.0,1.2))
			jumpplaysound = audio_play_sound(jumpsnd,501,false)
			audio_sound_gain(jumpsnd,1,0);
		
		
		}
	}
	
	tumbleplay = noone;
	
}



audio_sound_gain(runsnd,0.5,0)
audio_sound_gain(landsnd,0.5,0)
audio_sound_gain(tumblesnd,0.5,0)
audio_sound_gain(jumpsnd,0.5,0)

