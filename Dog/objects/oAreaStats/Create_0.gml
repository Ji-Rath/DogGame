/// @description 

//Datastructure of the current state of the game
SaveState = ds_map_create();

//Datastructure of the current items the player has
Items = ds_map_create();

//The current slot for game saving
CurrentSave = "Save1";

//Whether the player is loading the game or creating a new one
LoadGame = false;

// Array of enemies that will be in the battle scene
EnemyInfo = ds_list_create();

//Whether debug is enabled
global.Debug = false;

// Create keybinds instance for input
if (!instance_exists(oKeybindManager))
	instance_create_layer(0, 0, "Instances", oKeybindManager);
	
//Load Player Stats
scrPlayerStats();

scribble_init("Fonts", "fnt_main", true);

/// @func StoreEnemy(enemy1, enemy2, ...);
/// @desc Pass enemies to initialize in the battle scene
/// @arg {obj} Enemy
function StoreEnemy()
{
	ds_list_clear(EnemyInfo);
	for (var i=0;i<argument_count;i++)
	{
		// Ensure that instance passed in contains battleinfo
		var Enemy = argument[i];
		if(variable_instance_exists(Enemy, "BattleInfo"))
			ds_list_add(EnemyInfo, Enemy.BattleInfo);
	}
}