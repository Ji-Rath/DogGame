///@description event_fire
///@arg event

with(eventmanager){
	var ev = argument[0];
	
	//check if there is event entry
	
	if(ds_map_exists(eventMap, ev))
	{
		// get listeners
		var listenerList = eventMap[? ev];
		
		var len = ds_list_size(listenerList);
		
		var listenerInfo, listener, script, args;
		
		var i = 0; repeat(len)
		{
			
			listenerInfo = listenerList[| i];
			listener = listenerInfo[0];
			script = listenerInfo[1];
			
			var lenArgs = array_length_1d(listenerInfo)-2;
			var unregister = false;
			
			if(lenArgs <= 0){
				if (instance_exists(listener))
				{
					with(listener) 
					{
						unregister = script_execute(script);
					}
				}
				else
				{
					
					unregister = true;
					
				}
			}
			else
			{
				if (instance_exists(listener))
				{
					args = array_create(lenArgs, 0);
					array_copy(args, 0, listenerInfo, 2, lenArgs);
					with(listener)
					{
					
						script_execute_alt(script,args);
					
					
					}
				}
				else
				{
					unregister = true;
					
					
				}
				if(unregister)
				{
					event_unregister(ev,listener);
				}
				
				
			}
				
		}
			
			
			
			i++;
			
			
			
			
		}
		
	}
	
