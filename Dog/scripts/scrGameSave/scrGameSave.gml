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
	
	// Save Room
	ds_map_replace(oAreaStats.SaveState,"Room",room_get_name(room));

	// Save Enemy State
	SaveObject(oEnemyBase, ["x","y","Health"]);

	// Save Trigger State
	SaveObject(oTriggerBase, ["Used"]);
	
	// Save NPCs
	SaveObject(oNPCBase, ["Used"]);

	//Save ds map to file
	var SaveText = ds_map_write(oAreaStats.SaveState);
	ini_open("GameSave.sav");
	ini_write_string("Saves",SaveName,SaveText);
	ini_close();


}

function CreateMissingObjects(Object)
{
	var InstanceData = GetInstanceData(Object);
	var KeyList = ds_map_keys_to_array(InstanceData);
	for(var i=0; i<array_length(KeyList);i++)
	{
		var Instance = KeyList[i];
		// Check if instance doesnt exist on current map
		if (Instance != "undefined" && !instance_exists(Instance))
		{
			// Create replacement instance with identical variable values
			var NewInstance = instance_create_layer(0, 0, "Instances", real(Object));
			
			SetID(NewInstance, Instance);
		}
	}
	
	//Update save state
	SetInstanceData(Object, InstanceData);
}

///@desc Load a specified object
function LoadObject(Object)
{
	CreateMissingObjects(Object);

	with(Object)
	{
		// Use Read-Write instanceid if possible, fall back to built-in otherwise
		var ID = GetID(self);
		
		// Get data list (contains name and value lists)
		var DataList = GetVariableData(object_index, ID);
		
		// Get variable names and value lists
		var VarNames = ds_list_create();
		var VarValues = ds_list_create();
		var NameString = ds_map_find_value(DataList, "VarNames");
		var NameValues = ds_map_find_value(DataList, "VarValues");
		if (NameString && NameValues)
		{
			ds_list_read(VarNames, NameString);
			ds_list_read(VarValues, NameValues);
		
			//show_debug_message("Variable List Size: "+string(ds_list_size(VarNames)));
			// Loop through all variables to sync
		    for(var i=0;i<ds_list_size(VarNames);i++)
		    {
				show_debug_message("Variable: "+string(ds_list_find_value(VarNames, i)) + " | "+string(ds_list_find_value(VarValues, i)));
				// Ensure the variables exist
				if (variable_instance_exists(self, ds_list_find_value(VarNames, i)))
				{
					// Update value
					variable_instance_set(self, ds_list_find_value(VarNames, i), ds_list_find_value(VarValues, i));
					//show_debug_message(string(ds_list_find_value(VarNames, i))+": "+ string(ds_list_find_value(VarValues, i)));
				}
		    }
		}
	}
}

function SaveObject(Object, VariableArray)
{
	if (!instance_exists(Object)) { return; }
	
	with(Object)
	{
		var VarValues = ds_list_create(); // DS list to store variable values
		var VarNames = ds_list_create();
		
		// Add all specified variables to array
		for(var i=0;i<array_length(VariableArray);i++)
		{
			if (variable_instance_exists(self, VariableArray[i]))
			{
				ds_list_add(VarNames, VariableArray[i]);
				ds_list_add(VarValues, variable_instance_get(self, VariableArray[i]))
				//show_debug_message("Added: "+string(VariableArray[i])+" | "+string(variable_instance_get(self, VariableArray[i])));
			}
		}
		
		// Combine names and values together in a list
		var VarMap = ds_map_create();
		ds_map_add(VarMap, "VarNames", ds_list_write(VarNames));
		ds_map_add(VarMap, "VarValues", ds_list_write(VarValues));
		
		//show_debug_message("Saved: "+object_get_name(object_index));
		
		// Use Read-Write instanceid if possible, fall back to built-in otherwise
		var ID = GetID(self);
		
		// Update object map data
		SetVariableData(object_index, ID, VarMap);
	}
}

function GetID(Instance)
{
	var ID = Instance.id;
	
	if (variable_instance_exists(Instance, "InstanceID"))
		ID = Instance.InstanceID;
	
	return ID;
}

function SetID(Instance, NewID)
{
	if (variable_instance_exists(Instance, "InstanceID"))
		Instance.InstanceID = NewID;
}