/// @description Insert description here
// You can write your code in this editor

x = oPlayer.x;
y = oPlayer.y;


	

	knockbackcount += 1;
	if (knockbackcount < 2)
	{
		sprite_index = sPlayerdeathknockback;
		image_index = 0;
		audio_play_sound(deathsfx,501,false)
		ScreenShake(20,60);
		
	}
	else if (knockbackcount < (2*image_number)-6)
	{
		sprite_index = sPlayerdeathknockback;
		
	
	}
	else
	{
		sprite_index = sPlayerdeathknockback;
		image_index = image_number-2;
		image_alpha -= 0.05
		
		
	}
	
	
	
	
	if (knockbackcount < 6)
	{
		color = make_colour_hsv(0, 0, 300);
		
		
		
	}
	else
	{
		color = make_colour_hsv(0, 0, val);
		
		val -= 5;
	}
	
	
	var deathsecs = 3;
	
	if (knockbackcount > deathsecs*60)
	{
		
		if (file_exists("savedgame.sav"))
		{
			var _wrapper = LoadJSONFromFile("savedgame.sav");
			var _list = _wrapper[? "ROOT"];
	
	
			for (var i = 0; i < ds_list_size(_list); i++)
			{
		
				var _map = _list[| i]
		
				//var _obj = _map[? "obj"];
		
		
				gameload.easefromblack2 = true;
				room_goto(asset_get_index(_map[? "room"]))
		
			
				gameload.juststarted = (_map[? "juststarted"])
				gameload.beginningsleep = (_map[? "beginningsleep"])
				gameload.spawnx = _map[? "playerx"]
				gameload.spawny = _map[? "playery"]
		
			
				statsload.phealth = statsload.maxphealth
				statsload.maxphealth = (_map[? "maxphealth"])
		
			
				playerload.state = _map[? "playerstate"]
				playerload.doghere = (_map[? "doghere"])
		
		
		
		
		
		
		
		
			}
	
			ds_map_destroy(_wrapper);
	
		
		
		}

}