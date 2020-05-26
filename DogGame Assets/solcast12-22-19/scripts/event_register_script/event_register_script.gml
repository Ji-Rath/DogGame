///@description event_register_script
///@arg event
///@arg id
///@arg script
///@arg arg1...*



with(eventmanager) {
	var ev = argument[0];
	var objID = argument[1];
	
	if (ds_map_exists(eventMap, ev))
	{
		// add event to event map
		var listenerList = ds_list_create();
		
		//add listener info to event map
		ds_map_add_list(eventMap, ev, listenerList);
		
	} else {
		
		var listenerList = eventMap[? ev]
	}
	
	
	//add listener info
	var listenerInfo;
	
	// add listener ID
	listenerInfo[0] = objID;
	
	//Add script and arguments
	
	var len = argument_count-2;
	var i = 0; repeat(len){
		listenerInfo[i+1] = argument[i+2]
		i++;
		
	}
	//add listener info to listener list
	
	ds_list_add(listenerList, listenerInfo);
	
}


