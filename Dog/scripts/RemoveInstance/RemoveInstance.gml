// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

/// @todo refactor to support new saving system
function RemoveInstance(KeyName, InstanceID)
{
	var DataList = FindSavedValues(KeyName, InstanceID);
	
	var VarNames = ds_list_find_value(DataList, 0);
	var VarValues = ds_list_find_value(DataList, 1);
	
	var HealthIndex = ds_list_find_index(VarNames, "Health");
	if (HealthIndex != -1)
	{
		ds_list_set(VarValues, HealthIndex, 0);	
		ds_list_replace(DataList, 1, ds_list_write(VarValues));
	}
	
	// Add variable values and names to map
	var DataMap = ds_map_find_value(oAreaStats.SaveState,KeyName);
	ds_map_replace(DataMap, string(InstanceID), ds_list_write(DataList));
	
	// Update save state
	ds_map_replace(oAreaStats.SaveState,KeyName,ds_map_write(DataMap));
}