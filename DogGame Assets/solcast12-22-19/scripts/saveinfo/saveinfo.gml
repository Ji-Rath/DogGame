
	var _root_list = ds_list_create();
	
	
	var _map = ds_map_create();
	ds_list_add (_root_list,_map);
	
	ds_list_mark_as_map(_root_list,ds_list_size(_root_list)-1);
	var statname = object_get_name(stats)
	var statindex = asset_get_index(statname)
	
	
	
	var gamename = object_get_name( game);
	var gameindex = asset_get_index(gamename)
	
	var roomname = room_get_name(room);
	
	ds_map_add (_map,"layer", "game");
	ds_map_add (_map,"game", gameindex);
	ds_map_add (_map,"juststarted", gameindex.juststarted);
	ds_map_add(_map,"beginningsleep",gameindex.beginningsleep);
	ds_map_add(_map,"pearlmet",gameindex.pearlmet)
	ds_map_add(_map,"room",roomname);
	
	
	
	ds_map_add(_map,"stats",statindex);
	ds_map_add(_map,"statslayer","stats");
	ds_map_add(_map,"statsx",statindex.x);
	ds_map_add(_map,"statsy",statindex.y);
	ds_map_add(_map,"phealth",statindex.phealth);
	ds_map_add(_map,"maxphealth",statindex.maxphealth);
	ds_map_add(_map,"shovel",statindex.shovel);
	
	
	ds_map_add(_map,"player",oPlayer);
	ds_map_add(_map,"playerstate",oPlayer.state);
	ds_map_add(_map,"playerx",x);
	ds_map_add(_map,"playery",y);
	ds_map_add(_map,"doghere",oPlayer.doghere);

	
	
	
var _wrapper = ds_map_create();
ds_map_add_list(_wrapper,"ROOT",_root_list);


var _string = json_encode(_wrapper);

SaveStringToFile("savedgame.sav",_string);


ds_map_destroy(_wrapper);

