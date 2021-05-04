/// @param SaveName
function scrGameSave() {
	var SaveName = argument[0];

	// Save Player position
	SaveObject(oDog, ["x","y"]);

	// Save Player Stats
	ds_map_replace(oAreaStats.SaveState,"PlayerHealth",global.PlayerHP);
	ds_map_replace(oAreaStats.SaveState,"PlayerPP",global.PlayerPP);
	ds_map_replace(oAreaStats.SaveState,"PlayerLevel",global.PlayerLevel);

	// Save Items
	ds_map_replace(oAreaStats.SaveState,"Items",ds_map_write(oAreaStats.Items));

	// Save Enemy State
	SaveObject(oEnemyBase, ["x","y","Health"]);

	// Save Trigger State
	SaveObject(oTriggerBase, [Used]);
	
	// Save NPCs
	SaveObject(oNPCBase, [Used]);

	//Save ds map to file
	var SaveText = ds_map_write(oAreaStats.SaveState);
	ini_open("GameSave.sav");
	ini_write_string("Saves",SaveName,SaveText);
	ini_close();


}

function LoadObject(Object)
{
	with(Object)
	{
		// Find value corresponding values to object that we want to load
	    var GridString = ds_map_find_value(oAreaStats.SaveState,room_get_name(room)+"_"+string(object_index));
	    if(GridString != undefined)
	    {
	        var Grid = ds_grid_create(0,0);
	        ds_grid_read(Grid,GridString);
	        for(var i=0;i<ds_grid_height(Grid);i++)
	        {
				// Attempt to match instance ids
	            if (ds_grid_get(Grid,0,i) == id)
	            {
					// Sync variable values
					var VarValues = ds_list_create();
					var VarNames = ds_list_create();
					ds_list_read(VarNames, ds_grid_get(Grid, 2, i));
					ds_list_read(VarValues, ds_grid_get(Grid, 1, i));
					for (var i=0;i<ds_list_size(VarNames);i++)
					{
						if (variable_instance_exists(self, ds_list_find_value(VarNames, i)))
						{
							variable_instance_set(self, ds_list_find_value(VarNames, i), ds_list_find_value(VarValues, i));
							//show_debug_message(string(ds_list_find_value(VarNames, i))+": "+ string(ds_list_find_value(VarValues, i)));
						}
					}
	            }
	        }
	    }
	}
}

function SaveObject(Object, VariableArray)
{
	//Save Enemy State
	var SaveGrid = ds_grid_create(array_length(VariableArray)+1,0);
	var KeyName = room_get_name(room)+"_"+string(object_index); // Key to see which object we are working with
	with(Object)
	{
		var VarValues = ds_list_create(); // DS list to store variable values
		var VarNames = ds_list_create();
	    ds_grid_resize(SaveGrid,ds_grid_width(SaveGrid),ds_grid_height(SaveGrid)+1); // Accomodate for additional object to save
	    var row = ds_grid_height(SaveGrid)-1; // Get last row index
	    ds_grid_add(SaveGrid,0,row,id); // Add unique instance key to grid
		
		// Add all specified variables to array
		for(var i=0;i<array_length(VariableArray);i++)
		{
			if (variable_instance_exists(self, VariableArray[i]))
			{
				ds_list_add(VarNames, VariableArray[i]);
				ds_list_add(VarValues, variable_instance_get(self, VariableArray[i]))
			}
		}
		
		// Add variable values and names to grid
		ds_grid_add(SaveGrid,1,row, ds_list_write(VarValues));
		ds_grid_add(SaveGrid,2,row, ds_list_write(VarNames));
	}
	ds_map_replace(oAreaStats.SaveState,KeyName,ds_grid_write(SaveGrid));
}