
	
	
	if (place_meeting(x,y,oHardfloor))
	{
	
		runsnd = runningsfx;
		
	
		landsnd = landsfx;
		tumblesnd = choose(tumblesfx)
	}
	else
	{
		
		runsnd = runninggrasssfx;
	
	
		landsnd = landsfx1;
		tumblesnd = choose(tumblesfx1)
		
	}
if (image_index = 14)
{
	audio_sound_pitch(wakeupsfx,random_range(0.6,1.3))
	audio_play_sound(wakeupsfx,501,false);
		
}

if (image_index = 46)
{
	audio_play_sound(runsnd,501,false);
	audio_sound_pitch(runsnd,random_range(0.6,1.3))
}
if (image_index = 64)
{
	audio_sound_pitch(wakeupsfx,random_range(0.6,1.3))
	audio_play_sound(wakeupsfx,501,false);
	
	
}
if (image_index = 77)
{
	audio_sound_pitch(runsnd,random_range(0.6,1.3))
	audio_play_sound(runsnd,501,false);
	
}

audio_sound_gain(runsnd,0.5,0)
audio_sound_gain(landsnd,0.5,0)
audio_sound_gain(tumblesnd,0.5,0)

