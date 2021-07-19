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

AllyInfo = ds_list_create();

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
	
	ds_list_clear(AllyInfo);
	with (oPartnerBase)
	{
		ds_list_add(oAreaStats.AllyInfo, BattleObject);
	}
}

TweenSet(TWEEN_DEFAULT, "delta", true);

GUISurface = surface_create(display_get_gui_width(), display_get_gui_height());

function sequence_transition_begin()
{
    /// @func sequence_transition_begin()
    if (event_type == ev_draw)
    {
        if (event_number == ev_gui)
        {
			if (!variable_instance_exists(self, "GUISurface"))
				GUISurface = surface_create(display_get_gui_width(), display_get_gui_height());
				
            // create surface
            if !surface_exists(GUISurface) GUISurface = surface_create(display_get_gui_width(), display_get_gui_height());
         
            // set target
            surface_set_target(GUISurface);
            draw_clear_alpha(c_black, 0);
        }
    }
}

function sequence_transition_end()
{
    /// @func sequence_transition_end()
    if (event_type == ev_draw)
    {
        if (event_number == ev_gui)
        {
            surface_reset_target();
        }
    }
}

