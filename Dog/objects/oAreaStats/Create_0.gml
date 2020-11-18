/// @description 

//Datastructure of the current state of the game
SaveState = ds_map_create();

//Datastructure of the current items the player has
Items = ds_map_create();

EnemyKey = 0; // Unique ID for encountered enemy
EnemyBattle = oCrabBattle; // Obj of enemy when going to battle

//The current slot for game saving
CurrentSave = "Save1";

//Whether the player is loading the game or creating a new one
LoadGame = false;

//Whether debug is enabled
global.Debug = false;

// Create keybinds instance for input
if (!instance_exists(oKeybinds))
	instance_create_layer(0, 0, "Instances", oKeybinds);
	
//Load Player Stats
scrPlayerStats();