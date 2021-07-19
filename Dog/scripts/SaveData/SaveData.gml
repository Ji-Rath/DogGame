///@desc Returns room ds map - contains all objects for room
function GetObjectData()
{
	//Optional room argument
	var Room = argument_count > 0 ? argument[0] : room;
	
	// Get DS Room Data
	var RoomString = ds_map_find_value(oAreaStats.SaveState, string(Room));
	var RoomData = ds_map_create();
	if (RoomString)
	{
		ds_map_read(RoomData, RoomString);
		//show_debug_message("Found Object Data: "+string(room_get_name(Room)));
	}
	return RoomData;
}

///@desc Returns object ds map - contains all instances for specified object type in room
function GetInstanceData(Object)
{
	//Optional room argument
	var Room = argument_count > 1 ? argument[1] : room;
	
	// Get DS Object Data
	var ObjectData = GetObjectData(Room);
	var InstanceData = ds_map_create();
	
	var InstanceString = ds_map_find_value(ObjectData, string(Object));
	if (InstanceString)
	{
		ds_map_read(InstanceData, InstanceString);
		//show_debug_message("Found Instance Data: "+string(Object));
	}
	
	return InstanceData;
}

///@desc  Returns instance ds map - contains variable data for specified instance in object in room
function GetVariableData(Object, InstanceID)
{
	//Optional room argument
	var Room = argument_count > 2 ? argument[2] : room;
	var VariableData = ds_map_create();
	
	// Get data list (contains name and value lists)
	var InstanceData = GetInstanceData(Object, Room);
	var VariableString = ds_map_find_value(InstanceData, string(InstanceID));
	if (VariableString)
	{
		ds_map_read(VariableData, VariableString);
		//show_debug_message("Found Variable Data: "+string(Object));
	}
	
	return VariableData;
}

///@desc Set ALL Object data for room
function SetObjectData(ObjectData)
{
	//Optional room argument
	var Room = argument_count > 1 ? argument[1] : room;
	ds_map_replace(oAreaStats.SaveState, string(Room), ds_map_write(ObjectData));
}

///@desc Set instance data for ALL specified objects in room
///@arg Object Object Index
///@arg InstData Data of instance
function SetInstanceData(Object, InstData)
{
	//Optional room argument
	var Room = argument_count > 2 ? argument[2] : room;
	var ObjectData = GetObjectData(Room);
	ds_map_replace(ObjectData, string(Object), ds_map_write(InstData));
	SetObjectData(ObjectData, Room);
}

///@desc Set variable data for specified instance of object in room
///@arg Object Object Index
///@arg InstanceID ID of instance
///@arg VarData Variable data of instance
function SetVariableData(Object, InstanceID, VarData)
{
	//Optional room argument
	var Room = argument_count > 3 ? argument[3] : room;
	var InstanceData = GetInstanceData(Object, Room);
	ds_map_replace(InstanceData, string(InstanceID), ds_map_write(VarData));
	SetInstanceData(Object, InstanceData, Room);
}