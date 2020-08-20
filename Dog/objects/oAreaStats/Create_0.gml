/// @description 

//Datastructure of the current state of the game
SaveState = ds_map_create();

//Datastructure of the current items the player has
Items = ds_map_create();

//Values for the BattleScene
Enemy = noone;
EnemyKey = 0;

//The current slot for game saving
CurrentSave = "Save1";

//Whether the player is loading the game or creating a new one
LoadGame = false;

//Whether debug is enabled
global.Debug = false;