
	
////

if (file_exists("savedgame.sav"))
{
	var _wrapper = LoadJSONFromFile("savedgame.sav");
	var _list = _wrapper[? "ROOT"];
	
	
	for (var i = 0; i < ds_list_size(_list); i++)
	{
		
		var _map = _list[| i]
		
		//var _obj = _map[? "obj"];
		
		
		
		room_goto(asset_get_index(_map[? "room"]))
		
		gameload = instance_create_layer(x,y,"game",game)
		gameload.juststarted = (_map[? "juststarted"])
		gameload.beginningsleep = (_map[? "beginningsleep"])
		gameload.spawnx = _map[? "playerx"]
		gameload.spawny = _map[? "playery"]
		
		gameload.pearlmet = _map[? "pearlmet"]
		statsload = instance_create_layer((_map[? "statsx"]),(_map[? "statsy"]),"stats",stats)
		statsload.phealth = (_map[? "phealth"])
		statsload.maxphealth = (_map[? "maxphealth"])
		statsload.shovel = (_map[? "shovel"])
		
		playerload = instance_create_layer((_map[? "playerx"]),(_map[? "playery"]),"player",oPlayer)
		playerload.state = _map[? "playerstate"]
		playerload.doghere = (_map[? "doghere"])
		
		
		
		
		
		
		
		
	}
	
	ds_map_destroy(_wrapper);
	
	
	
	
	
	
}
