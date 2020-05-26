/// @description Insert description here
// You can write your code in this editor
var _root_list = ds_list_create();


with (game)
{
	var _map = ds_map_create();
	ds_list_add (_root_list,_map);
	
	ds_list_mark_as_map(_root_list,ds_list_size(_root_list)-1);
	var statindex = object_get_name(stats.object_index);
	var gameindex = object_get_name(game.object_index);
	
	ds_map_add (_map,"layer", layer);
	ds_map_add (_map,"game", gameindex);
	ds_map_add (_map,"juststarted", juststarted);
	ds_map_add(_map,"beginningsleep",beginningsleep);
	ds_map_add(_map,"room",room);
	
	ds_map_add(_map,"stats",statindex);
	ds_map_add(_map,"statslayer",statindex.layer);
	ds_map_add(_map,"statsx",statindex.x);
	ds_map_add(_map,"statsy",statindex.y);
	ds_map_add(_map,"phealth",statindex.phealth);
	ds_map_add(_map,"maxphealth",statindex.maxphealth);
	
	
	ds_map_add(_map,"player",player);
	ds_map_add(_map,"playerstate",player.state);
	ds_map_add(_map,"playerx",player.x);
	ds_map_add(_map,"playery",player.y);
	ds_map_add(_map,"dog,",dog);
	
	
	
	
	
	
	
	
}


var _wrapper = ds_map_create();
ds_map_add_list(_wrapper,"ROOT",_root_list);


var _string = json_encode(_wrapper);

SaveStringToFile("savedgame.sav,_string",_string);


ds_map_destroy(_wrapper);

