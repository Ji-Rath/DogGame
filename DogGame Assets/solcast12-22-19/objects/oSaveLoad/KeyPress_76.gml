/// @description Insert description here
// You can write your code in this editor



if (file_exists("savedgame.sav"))
{
	var _wrapper = LoadJSONFromFile("savedgame.sav");
	var _list = _wrapper[? "ROOT"];
	
	
	for (var i = 0; i < ds_list_size(_list); i++)
	{
		
		var _map = _list[| i]
		
		//var _obj = _map[? "obj"];
		
		
		room_goto(_map[? "room"])
		
		with (instance_create_layer(0,0,_map[? "layer"],_map[? "game"]))
		{
			juststarted = _map[? "juststarted"]
			beginningsleep = _map[? "beginningsleep"]
			
			
			
		}
		
		with (instance_create_layer(0,0,_map[? "statslayer"],_map[? "stats"]))
		{
			
			x = _map[? "statsx"]
			y = _map[? "statsy"]
			phealth = _map[? "phealth"]
			maxphealth = _map[? "maxphealth"]
			
			
		}
		
		
		with (instance_create_layer(0,0,_map[? "player"],game))
		{
			state = _map[? "playerstate"]
			x = _map[? "playerx"]
			y = _map[? "playery"]
			
			
			
			
		}
		
		with (instance_create_layer(0,0,_map[? "dog"],game))
		{
			
			
			
			
			
		}
		
		
	}
	
	ds_map_destroy(_wrapper);
	
	
	
	
	
	
}
