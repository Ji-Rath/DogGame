

/// @func TweenGroupSetTimeScale(group, time_scale);
function TweenGroupSetTimeScale(_group, _timescale)
{
	global.TGMS_GroupScales[? _group] = _timescale;
}


/// @func	TweenSet(tween[s], "dataLabel", value)
/// @desc	Sets data type for selected tween[s]
function TweenSet(_t, _dataLabel, _value) 
{
	/// @param tween[s]		tween id[s]
	/// @param "dataLabel"	data "label" string -- see supported list below
	/// @param value		value to apply to set data type
	/// @param [...]		(optional) additional values for modifying multi-property tweens

	/*
	    Supported Data Labels:
	        "group"         -- Assign tween to a group
	        "time"          -- Current time of tween in steps or seconds
	        "amount"		-- Sets the tween's time by a relative amount between 0.0 and 1.0 // Change to position?
	        "scale"			-- How fast a tween updates : Default = 1.0
	        "duration"      -- How long a tween takes to fully animate in steps or seconds
	        "ease"          -- The easing algorithm used by the tween
	        "mode"          -- The play mode used by the tween (ONCE, BOUNCE, PATROL, LOOP
	        "target"        -- Target instance associated with tween
	        "delta"         -- Toggle timing between seconds(true) and steps(false)
	        "delay"         -- Current timer of active delay
	        "delay_start"   -- The starting duration for a delay timer
	        "rest"
			"start"         -- Start value of the property or properties
	        "destination"   -- Destination value of the property or properties
	        "property"      -- Property or properties effected by the tween
        
	        e.g.
	            tween = Tween(id, EaseLinear, 0, true, 0, 1, "x", 0, 100);
	            TweenSet(tween, "duration", 2.5);
            
	    *** The following labels can update multiple properties by supplying
			values in the same order the properties were first assigned:
        
	        "start"
	        "destination"
	        "property"
        
	        e.g.
	            tween = Tween(id, EaseLinear, 0, true, 0, 1, "x", 0, 100, "y", 0, 100); // multi-property tween (x/y)
	            TweenSet(tween, "start", mouse_x, mouse_y); // update to x/y mouse coordinates
           
	    // The keyword [undefined] can be used to leave a property value unchanged
	        e.g.
	            TweenSet(tween, "start", undefined, mouse_y); // update "y" but leave "x" unchanged
	*/

	_t = TGMS_FetchTween(_t);
	
	var _pIndex = -1;
	
	repeat((argument_count-1) div 2)
	{
		_pIndex += 2;
		_dataLabel = argument[_pIndex];
		_value = argument[_pIndex+1];
	
	
		var _index = global.TGMS_TweenDataLabelMap[? _dataLabel];

		if (is_array(_t))
		{   
		    switch(_index)
		    {
		        case TWEEN.SCALE:
		            _t[@ TWEEN.SCALE] = _value * _t[TWEEN.DIRECTION];
		        break;
        
				// THIS IS ON PURPOSE! DON'T WORRY!
				case TWEEN.AMOUNT: _t[@ TWEEN.TIME] = _value * _t[TWEEN.DURATION];
		        case TWEEN.TIME: 
		            _t[@ _index] = _value; // THIS IS ON PURPOSE! Maybe I should separate these two cases for better clarity
			
					if (_t[TWEEN.STATE] >= 0 && _t[TWEEN.DURATION] != 0)
				    {
						TGMS_TweenProcess(_t, _t[TWEEN.TIME], _t[TWEEN.PROPERTY_DATA], is_real(_t[TWEEN.TARGET]) ? _t[TWEEN.TARGET] : _t[TWEEN.TARGET].ref);
				    }
		        break;
			
				case TWEEN.EASE:
					// Animation Curve ID
					if (is_real(_value))
					{
						_value = animcurve_get_channel(_value, 0);
					}
					else // "ease" string
					if (is_string(_value))
		    		{
						_value =  global.TGMS_ShortCodesEase[? TGMS_StringLower(_value, 0)];
		    		}
		    		
		    		// Update ease data
		    		_t[@ TWEEN.EASE] = _value;
			
					// Process tween right away if it is currently active and has a valid duration
					if (_t[TWEEN.STATE] >= 0 && _t[TWEEN.DURATION] != 0)
				    {
						TGMS_TweenProcess(_t, _t[TWEEN.TIME], _t[TWEEN.PROPERTY_DATA], is_real(_t[TWEEN.TARGET]) ? _t[TWEEN.TARGET] : _t[TWEEN.TARGET].ref);
				    }
				break;
         
		        case TWEEN.DELAY:
		            if (_t[TWEEN.DELAY] > 0)
		            {
		                _t[@ TWEEN.DELAY] = _value;
		            }
		        break;
        
				// TODO: Extend this to support "string" properties which also updates PROPERTY_DATA_RAW
				// Change to pass array
		        case TWEEN.START: // TODO... this might be redundant with if/else check
		        {
		        	if (_t[TWEEN.DELAY] > 0)
		        	{
		        		var _data = _t[TWEEN.PROPERTY_DATA_RAW];

						// Multiple properties
						if (is_array(_value))
						{
							var i = -1;
							var _iData = 1;
							repeat(array_length(_value))
							{	// Update start
								var _newStart = _value[++i];
								if (_newStart != undefined)
								{
									_data[@ _iData] = _newStart;   
								}
								_iData += 3;
							}
						}
						else // Single property
						{	// Update start
							_data[@ 1] = _value;
						}
		        	}
		        	else
		        	{
		        		var _data = _t[TWEEN.PROPERTY_DATA];

						// Multiple properties
						if (is_array(_value))
						{
							var i = -1;
							var _iData = 2;
							repeat(array_length(_value))
							{	// Update start
								var _newStart = _value[++i];
								if (_newStart != undefined)
								{	// Update change
									_data[@ _iData+1] = _data[_iData] + _data[_iData+1] - _newStart
									// Update new start
									_data[@ _iData] = _newStart;   
								}
								_iData += 4;
							}
						}
						else // Single property
						{	// Udpate change (destination - start)
							_data[@ 3] = _data[2] + _data[3] - _value;
							// Update start
							_data[@ 2] = _value;
						}
		        	}	
		        }
		        break;
        
	        	// TODO: Extend this to support "string" properties which also updates PROPERTY_DATA_RAW
		        case TWEEN.DESTINATION:
		        {
		        	if (_t[TWEEN.DELAY] > 0)
		        	{
		        		var _data = _t[TWEEN.PROPERTY_DATA_RAW];
					
						// Multiple properties
						if (is_array(_value)) 
						{
							var i = -1;
							var _iData = 2;
							repeat(array_length(_value))
							{	// Update change (destination - start)
								var _newDest = _value[++i];
								if (_newDest != undefined)
								{
									_data[@ _iData] = _newDest;   
								}
								_iData += 3;
							}
						}
						else // Single property
						{
							_data[@ 2] = _value;
						}
		        	}
		        	else
		        	{
						var _data = _t[TWEEN.PROPERTY_DATA];
					
						// Multiple properties
						if (is_array(_value)) 
						{
							var i = -1;
							var _iData = 2;
							repeat(array_length(_value))
							{	// Update change (destination - start)
								var _newDest = _value[++i];
								if (_newDest != undefined)
								{
									_data[@ _iData+1] = _newDest - _data[_iData];   
								}
								_iData += 4;
							}
						}
						else // Single property
						{	// Udpate change (destination - start)
							_data[@ 3] = _value - _data[2];
						}
		        	}
		        }
		        break;
        
	        	// TODO: Extend to support struct targets
		        case TWEEN.TARGET:
		            if (is_struct(_t[TWEEN.TARGET]) || _t[TWEEN.TARGET] != noone)
		            {
		            	_t[@ TWEEN.TARGET] = (is_real(_value)) ? _value.id : weak_ref_create(_value);
                
		                if (_t[TWEEN.STATE] >= 0)
		                {
		                    _t[@ TWEEN.STATE] = _t[TWEEN.TARGET]; // set active state
		                }
		            }
		        break;
			
				// TODO: ADD THIS IN...
				//case TWEEN.REST:
				
				//break;
			
			
				case TWEEN.GROUP:
					_t[@ TWEEN.GROUP] = _value;
				
					if (!ds_map_exists(global.TGMS_GroupScales, _t[TWEEN.GROUP]))
					{
						global.TGMS_GroupScales[? _t[TWEEN.GROUP]] = 1;	
					}
				break;
			
		        /*
		        case TWEEN.PROPERTY_DATA_RAW:
		            var _data = _t[TWEEN.PROPERTY_DATA];
		            var _argIndex = 0;
                
					repeat(argument_count-2)
		            {
		                var _dataIndex = 1 + _argIndex*5; // Note: first index is property count
		                var _property = argument[++_argIndex+1];
                    
		                if (!is_undefined(_property))
		                {
		                    if (is_array(_property)) // Extended Property
		                    {   
		                        _data[@ _dataIndex] = _property[0] // script
		                        _data[@ _dataIndex+4] = _property[1]; // data
		                    }
		                    else // is string
		                    {	// Get raw property setter script
		                        var _propRaw = global.TGMS_PropertySetters[? _property];
		                        _data[@ _dataIndex] = _propRaw; // script
		                        _data[@ _dataIndex+4] = _propRaw; // data
		                    }  
		                }
		            }
		        break;
		        */
			
		        default: 
					_t[@ _index] = _value;
		    }
		}

		// HANDLE MULTI-TWEEN SETTING
		if (is_struct(_t))
		{
			var _args = array_create(argument_count+1);
			_args[0] = _t;
			_args[1] = TweenSet;
			_args[2] = _index;
			_args[3] = _value;
		
			var i = 3;
			repeat(argument_count-3)
			{
				++i;
				_args[i] = argument[i-1]; 
			}
		
			script_execute_ext(TGMS_TweensExecute, _args);
		}
	}
}

/// @desc Stops selected tween[s]
function TweenStop(_t)
{
	/// TweenStop(tween[s])
	/// @param tween[s] tween id
	/// return: na

	_t = TGMS_FetchTween(_t);

	if (is_array(_t))
	{
	    if (_t[TWEEN.STATE] >= 0 || _t[TWEEN.STATE] <= TWEEN_STATE.PAUSED)
	    {
	        _t[@ TWEEN.STATE] = TWEEN_STATE.STOPPED;
        
	        if (_t[TWEEN.DELAY] >= 0) // NOTE: Careful with the -1 jump delays...
	        {
	            _t[@ TWEEN.DELAY] = -1;   
	            TGMS_ExecuteEvent(_t, TWEEN_EV_STOP_DELAY, 0);
	        }
	        else
	        {
	            TGMS_ExecuteEvent(_t, TWEEN_EV_STOP, 0);
	        }
            
	        if (_t[TWEEN.DESTROY]) { TweenDestroy(_t); }
	    }
	}
	else
	if (is_struct(_t))
	{
	    TGMS_TweensExecute(_t, TweenStop);
	}
}

/// @desc Pauses selected tween[s]
function TweenPause(_t) 
{
	/// TweenPause(tween[s])
	/// @param tween[s] tween id
	/// return: na

	_t = TGMS_FetchTween(_t);

	if (is_array(_t))
	{
	    if (_t[TWEEN.STATE] >= 0) 
		{
	        _t[@ TWEEN.STATE] = TWEEN_STATE.PAUSED;
	        TGMS_ExecuteEvent(_t, TWEEN_EV_PAUSE, 0);
	    }
		else 
		if (_t[TWEEN.STATE] == TWEEN_STATE.DELAYED) 
		{
	        _t[@ TWEEN.STATE] = TWEEN_STATE.PAUSED;
	        TGMS_ExecuteEvent(_t, TWEEN_EV_PAUSE_DELAY, 0);
	    }
	}
	else
	if (is_struct(_t))
	{
	    TGMS_TweensExecute(_t, TweenPause);
	}
}

/// @desc Resumes selected tween[s]
function TweenResume(_t) 
{
	/// TweenResume(tween[s])
	/// @param tween[s] tween id
	/// return: na

	_t = TGMS_FetchTween(_t);

	if (is_array(_t))
	{		
	    if (_t[TWEEN.STATE] == TWEEN_STATE.PAUSED)
	    {		
	        if (_t[TWEEN.DELAY] > 0)
	        {
	            _t[@ TWEEN.STATE] = TWEEN_STATE.DELAYED;
	            TGMS_ExecuteEvent(_t, TWEEN_EV_RESUME_DELAY, 0);
	        }
	        else
	        {
	            _t[@ TWEEN.STATE] = _t[TWEEN.TARGET];
	            TGMS_ExecuteEvent(_t, TWEEN_EV_RESUME, 0);
	        }
	    }
	}
	else
	if (is_struct(_t))
	{
	    TGMS_TweensExecute(_t, TweenResume);
	}
}

/// @desc Reverses selected tween[s]
function TweenReverse(_t) 
{
	/// TweenReverse(tween[s])
	/// @param tween[s] tween id
	/// return: na

	_t = TGMS_FetchTween(_t);

	if (is_array(_t))
	{
	    if (_t[TWEEN.STATE] > 0 || _t[TWEEN.STATE] == TWEEN_STATE.PAUSED)
	    {
	        _t[@ TWEEN.DIRECTION] = -_t[TWEEN.DIRECTION];
	        _t[@ TWEEN.SCALE] = -_t[TWEEN.SCALE];
	        TGMS_ExecuteEvent(_t, TWEEN_EV_REVERSE, 0);
	    }
	}
	else
	if (is_struct(_t))
	{
	    TGMS_TweensExecute(_t, TweenReverse);
	}
}

/// @desc Finishes selected tween[s]
function TweenFinish(_t, _callEvent) 
{
	/// TweenFinish(tween[s],call_event)
	/// @param tween[s]		tween id
	/// @param call_event	execute FINISH EVENT callbacks?

	/*      
	    INFO:
	        Finishes the specified tween, updating it to its destination.
	        DOES NOT affect tweens using PATROL|LOOP|REPEAT play modes.
			(To be changed with continue counts)
	*/

	_t = TGMS_FetchTween(_t);

	if (is_array(_t))
	{
	    if (_t[TWEEN.DELAY] > 0) { return 0; }
    
	    if (_t[TWEEN.STATE] >= 0 || _t[TWEEN.STATE] == TWEEN_STATE.PAUSED)
	    {
	        switch(_t[TWEEN.MODE])
	        {
	        case TWEEN_MODE_ONCE: 
				//> Set time to tween end
				_t[@ TWEEN.TIME] = _t[TWEEN.DURATION];
			break;
	        
			case TWEEN_MODE_BOUNCE: 
				//> Set time to tween start
				_t[@ TWEEN.TIME] = 0; 
			break;
			
			case TWEEN_MODE_PATROL:
				//> Exit script early if count is endless
				if (_t[TWEEN.CONTINUE_COUNT] <= -1) return;
				
				//> Determine start/end based on odd/even count
				if (_t[TWEEN.CONTINUE_COUNT] % 2 == 0) {
					_t[@ TWEEN.TIME] = _t[TWEEN.DIRECTION] == 1 ? _t[TWEEN.DURATION] : 0;
				}
				else {
					_t[@ TWEEN.TIME] = _t[TWEEN.DIRECTION] == 1 ? 0 : _t[TWEEN.DURATION];
				}	
			break;
			
			case TWEEN_MODE_LOOP:
				//> Exit script early if count is endless
				if (_t[TWEEN.CONTINUE_COUNT] <= -1) return;
				//> Set time to tween end
				_t[@ TWEEN.TIME] = _t[TWEEN.DURATION];	
			break;
			
			case TWEEN_MODE_REPEAT:
				//> Exit script early if count is endless
				if (_t[TWEEN.CONTINUE_COUNT] <= -1) return;
				//> Set time to tween end
				_t[@ TWEEN.TIME] = _t[TWEEN.DURATION];
				
				//> Loop through data array and change start positions
				var _data = _t[TWEEN.PROPERTY_DATA];
				var i = -2;
				repeat(_data[0])
				{
					i += 4;
					_data[@ i] += _data[i+1] * _t[TWEEN.CONTINUE_COUNT]; 
				}
			break;
	        }
        
			//> Set tween state as STOPPED
	        _t[@ TWEEN.STATE] = TWEEN_STATE.STOPPED; 
	        //> Update property with start value
			TGMS_TweenProcess(_t, _t[TWEEN.TIME], _t[TWEEN.PROPERTY_DATA], is_real(_t[TWEEN.TARGET]) ? _t[TWEEN.TARGET] : _t[TWEEN.TARGET].ref);
	        //> Execute finish event IF set to do so
	        if (_callEvent) { TGMS_ExecuteEvent(_t, TWEEN_EV_FINISH, 0); }
	        //> Destroy tween if it is set to be destroyed
	        if (_t[TWEEN.DESTROY]) { TweenDestroy(_t); }
	    }
	}
	else
	if (is_struct(_t))
	{
	    TGMS_TweensExecute(_t, TweenFinish, _callEvent);
	}
}
	
/// @desc Finishes delay for selected tween[s]
function TweenFinishDelay(_t, _callEvent) 
{
	/// TweenFinishDelay(tween[s],callevent)
	/// @param tween[s]		tween id
	/// @param call_event	execute FINISH EVENT callbacks?

	_t = TGMS_FetchTween(_t);

	if (is_array(_t))
	{
	    if (_t[TWEEN.DELAY] > 0)
	    {
			//> Mark delay for removal from delay list
	        _t[@ TWEEN.DELAY] = -1;
	        //> Execute FINISH DELAY event
	        if (_callEvent) { TGMS_ExecuteEvent(_t, TWEEN_EV_FINISH_DELAY, 0); }
			//> Set tween as active
	        _t[@ TWEEN.STATE] = _t[TWEEN.TARGET];                
			//> Process tween
			TGMS_TweenProcess(_t, 0, _t[TWEEN.PROPERTY_DATA], is_real(_t[TWEEN.TARGET]) ? _t[TWEEN.TARGET] : _t[TWEEN.TARGET].ref);
			//> Execute PLAY event
	        TGMS_ExecuteEvent(_t, TWEEN_EV_PLAY, 0);
	    }
	}
	else
	if (is_struct(_t))
	{
	    TGMS_TweensExecute(_t, TweenFinishDelay, _callEvent);
	}
}

/// @desc Manually destroys selected tween[s]
function TweenDestroy(_t) 
{
	/// @param tween[s]		tween id[s]
	/// return: null tween id
	/*
	    Note: Tweens are always automatically destroyed when their target instance is destroyed.
	*/

	_t = TGMS_FetchTween(_t);

	if (is_array(_t))
	{
		if (_t[TWEEN.STATE] == TWEEN_STATE.DESTROYED)
		{
		    return undefined;
		}
    
		// NOTE: Don't need the extra map-check here, as the handle SHOULD always exist at this point, if reached
	
		// Invalidate tween handle
		ds_map_delete(global.TGMS_TweenIndexMap, _t[TWEEN.ID]);
    
		// NOTE: We don't have to destroy the property list here... that will be done in the auto-cleaner
	
		_t[@ TWEEN.STATE] = TWEEN_STATE.DESTROYED; // Set state as destroyed
		_t[@ TWEEN.ID] = undefined; // Nullify self reference
    
		// Invalidate tween target or destroy target instance depending on destroy mode
		if (_t[TWEEN.DESTROY] == 2)
		{	
			if (is_real(_t[TWEEN.TARGET]))
			{
				// Destroy Target Instance
			    if (instance_exists(_t[TWEEN.TARGET]))
			    {
			        with(_t[TWEEN.TARGET]) instance_destroy(_t[TWEEN.TARGET]);
			    }
			    else
			    {
			        instance_activate_object(_t[TWEEN.TARGET]); // Attempt to activate target by chance it was deactivated
			        with(_t[TWEEN.TARGET]) instance_destroy(); // Attempt to destroy target
			    } 
			}
		}
	
		_t[@ TWEEN.TARGET] = noone; // Invalidate tween target
		return undefined;
	}
	else
	if (is_struct(_t))
	{
		TGMS_TweensExecute(_t, TweenDestroy);
	}

	return undefined;
}

/// @desc Forces tween to be destroyed when finished or stopped
function TweenDestroyWhenDone(_t, _destroy) 
{
	/// TweenDestroyWhenDone(tween[s], destroy, kill_target)
	/// @param	tween[s]		tween id(s)
	/// @param	destroy			destroy tween[s] when finished or stopped?
	/// @param	kill_target		(optional) destroy target when tween finished or stopped?

	if (argument_count == 3 && argument[2])
	{
		_destroy = 2;
	}

	_t = TGMS_FetchTween(_t);

	if (is_array(_t))
	{
		_t[@ TWEEN.DESTROY] = _destroy;
	}
	else
	if (is_struct(_t))
	{
		TGMS_TweensExecute(_t, TweenDestroyWhenDone, _destroy);
	}
}


function TweenStep(tween, amount)
{
	var _t = TGMS_FetchTween(tween);
	
    // IF system time scale isn't "paused"
    if (is_array(_t))
    {  

    }
	else 
	if (is_struct(_t))
	{
	    TGMS_TweensExecute(_t, TweenStep, amount);
	}
}
