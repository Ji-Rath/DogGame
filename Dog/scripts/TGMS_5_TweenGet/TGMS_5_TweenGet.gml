
var HIDE_WARNING; HIDE_WARNING = TweensIncludeDeactivated + TweenCalc 
				  + TweenIsActive + TweenIsPlaying + TweenIsPaused + TweenIsResting
			      + TweenJustStarted + TweenJustFinished + TweenJustPaused + TweenJustResumed 
				  + TweenJustRested + TweenJustContinued + TweenJustStopped;			

function TweenGroupGetTimeScale(group)
{
	if (!ds_map_exists(global.TGMS_GroupScales, group))
	{	// Set a default group scale if it doesn't exist
		global.TGMS_GroupScales[? group] = 1.0;
	}
	
	return global.TGMS_GroupScales[? group];	
}

/// @func	TweenGet(tween, "dataLabel")
/// @desc Returns data type for the selected tween
var TweenGet;
function TweenGet(_t, _dataLabel) 
{
	/*
		PLEASE NOTE THAT THIS FUNCTION RETURNS [undefined] IF THE TWEEN DOES NOT EXIST!
	*/
	
	//	tween			tween id
	//	"dataLabel"		data "label" string -- see supported data labels below
	/*
	    Supported Data Labels:
	        "group"         -- Tween group
	        "time"          -- Current time of tween in steps or seconds
	        "amount"		-- Sets the tween's time by a relative amount between 0.0 and 1.0 
	        "scale"			-- How fast a tween updates : Default = 1.0
	        "duration"      -- How long a tween takes to fully animate in steps or seconds
	        "ease"          -- The easing algorithm used by the tween
	        "mode"          -- The play mode used by the tween (ONCE, BOUNCE, PATROL, LOOP
	        "target"        -- Target instance associated with tween
	        "delta"         -- Toggle timing between seconds(true) and steps(false)
	        "rest"
			"delay"         -- Current timer of active delay
	        "delay_start"   -- The starting duration for a delay timer
	        "start"         -- Start value of the property or properties
	        "destination"   -- Destination value of the property or properties
	        "property"      -- Property or properties effected by the tween
        
	        e.g.
	            tween = TweenFire(id, EaseLinear, 0, true, 0, 1, "x", 0, 100);
	            duration = TweenGet(tween, "duration");
            
	    ***	WARNING *** The following labels return multiple values as an array for multi-property tweens:
        
				"start"    
				"destination"
				"property"
        
	        e.g.
	            tween = TweenFire(id, EaseLinear, 0, true, 0, 1, "x", 0, 100, "y", 0, 100);
	            startValues = TweenGet(tween, "start");
	            xStart = startValues[0];
	            yStart = startValues[1];
	*/

	_t = TGMS_FetchTween(_t);
	if (is_undefined(_t)) return undefined;

	switch(global.TGMS_TweenDataLabelMap[? _dataLabel])
	{
	    case TWEEN.PROPERTY_DATA_RAW:
			var _data = _t[TWEEN.PROPERTY_DATA_RAW];
			var _count = array_length(_data) div 3;
			
			if (_count == 1)
			{
				return _data[0];	
			}
			else
			{
				var _return = array_create(_count);
				var _iData = 0;
				var i = -1;
				repeat(_count)
				{
					_return[++i] = _data[_iData];
					_iData += 3;
				}
				
				return _return;
			}
	    break;
		
	    case TWEEN.DESTINATION:
			var _data = _t[TWEEN.PROPERTY_DATA];
			
			if (is_real(_data) || _t[TWEEN.DELAY] > 0)
			{
				_data = _t[TWEEN.PROPERTY_DATA_RAW];
				
				var _propCount = array_length(_data) div 3;
				
				if (_propCount == 1)
				{
					return _data[2];
				}

				var _ret = array_create(_propCount);
				var i = -1;
				var _iData = 2;
				repeat(_propCount)
				{
					_ret[++i] = _data[_iData];
					_iData += 3;
					
				}
					
				return _ret;
			}
			
			if (_data[0] == 1)
			{
				return _data[2]+_data[3];	
			}
			else
			{
				var _count = _data[0];
				var _return = array_create(_count);
				var _iData = 2;
				var i = -1;
				repeat(_count)
				{
					_return[++i] = _data[_iData]+_data[_iData+1];
					_iData += 4;
				}
				
				return _return;
			}
	    break;
    
	    case TWEEN.START:
			var _data = _t[TWEEN.PROPERTY_DATA];
			
			if (is_real(_data) || _t[TWEEN.DELAY] > 0)
			{
				_data = _t[TWEEN.PROPERTY_DATA_RAW];
				
				var _propCount = array_length(_data) div 3;
				
				if (_propCount == 1)
				{
					return _data[2];
				}

				var _ret = array_create(_propCount);
				var i = -1;
				var _iData = 1;
				repeat(_propCount)
				{
					_ret[++i] = _data[_iData];
					_iData += 3;	
				}
					
				return _ret;
			}
			
			if (_data[0] == 1)
			{
				return _data[2];	
			}
			else
			{
				var _count = _data[0];
				var _return = array_create(_count);
				var _iData = 2;
				var i = -1;
				repeat(_count)
				{
					_return[++i] = _data[_iData];
					_iData += 4;
				}
				
				return _return;
			}
	    break;
    
	    case TWEEN.DELAY: return _t[TWEEN.DELAY] <= 0 ? 0 : _t[TWEEN.DELAY]; break;
	    case TWEEN.SCALE: return _t[TWEEN.SCALE] * _t[TWEEN.DIRECTION]; break;
		case TWEEN.TIME:  return clamp(_t[TWEEN.TIME], 0, _t[TWEEN.DURATION]); break;
		default:		  return _t[global.TGMS_TweenDataLabelMap[? _dataLabel]]
	}
}

/// @func	TweensIncludeDeactivated(include?)
/// @desc	Include tweens with deactivated targets? Used by Tweens() function. Default: false
function TweensIncludeDeactivated(_include) 
{
	global.TGMS_TweensIncludeDeactivated = _include;
}


/// @func	TweenCalc(tween, <amount>) : real | array
/// @desc	Returns calculated value from tween's current state
function TweenCalc(_t) 
{
	// tween		tween id
	// <amount>		(optional) amount between 0-1 (passing as an array will check explicit time)
	/*
	    INFO:
	        Returns a calculated value using a tweens current state.
			A real number is returned directly if only one property is tweened.
			An array of real numbers is returned if multiple properties are tweened,
			in the order they were originally supplied to the tween.
        
	    EXAMPLE:
	        // Create defined tween
	        tween = TweenFire(id, EaseInOutQuint, 0, true, 0.0, 2.5, "", x, mouse_x);
        
	        // Calculate value of tween at its current state
	        x = TweenCalc(tween);
			
			// Calculate a tweens "halfway" value
			midPoint = TweenCalc(tween, 0.5);
			
			// Create multi-property tween
			tweenXY = TweenFire(id, EaseOutQuad, 0, false, 0, 30, "", x, mouse_x, "", y, mouse_y);
			midPoints = TweenCalc(tweenXY, 0.5);
			var _x = midPoints[0];
			var _y = midPoints[1];
	*/

	_t = TGMS_FetchTween(_t);
	if (is_undefined(_t)) { return 0; }

	var _time = clamp(argument_count == 1 ? _t[TWEEN.TIME] : (is_array(argument[1]) ? array_get(argument[1], 0) : _t[TWEEN.DURATION]*argument[1]), 0, _t[TWEEN.DURATION]);
	var _amount = _t[@ TWEEN.EASE](_time, 0, 1, _t[TWEEN.DURATION]);

	var _data = _t[TWEEN.PROPERTY_DATA];
	var _count = array_length(_data) div 4;
	var _return = array_create(_count);
	var _dataIndex = -1;
		
	repeat(_count)
	{
		++_dataIndex;
		var _start = _data[2 + 4*_dataIndex];
		var _dest =  _start + _data[3 + 4*_dataIndex];
		_return[_dataIndex] = lerp(_start, _dest, _amount);
	}
    
	return _count == 1 ? _return[0] : _return;
}

/// @func	TweenExists(tween) : bool
/// @desc	Checks if tween exists
function TweenExists(_t) 
{
	if (is_real(_t))
	{
		//SharedTweener(); // NOTE: Could adapt this into if statement later?
		// Inline version of SharedTweener()
		if (!instance_exists(o_SharedTweener))
		{
			instance_create_depth(0,0,0,o_SharedTweener);
		}
		
	    if (ds_map_exists(global.TGMS_TweenIndexMap, _t))
	    {
	        _t = global.TGMS_TweenIndexMap[? _t];
	    }
	    else
	    {
	        return false;
	    }
	}
	else
	if (is_array(_t))
	{
	    if (_t[TWEEN.STATE] == TWEEN_STATE.DESTROYED) 
		{ 
			return false; 
		}
	}
	else
	{
	    return false;
	}
    
	// _t now means target... this is an optimisation trick to avoid use of local vars
	_t = _t[TWEEN.TARGET];
	
	if (is_real(_t))
	{
		if (instance_exists(_t)) { return true; }

		instance_activate_object(_t);

		if (instance_exists(_t))
		{
		    instance_deactivate_object(_t);
		    return true;
		}
	}
	else
	if (weak_ref_alive(_t))
	{
		return true;
	}
	
	return false;
}

/// @func	TweenIsActive(tween) : bool
/// @desc	Checks if tween is active -- Returns true if tween is playing OR actively processing a delay
function TweenIsActive(_t) 
{
	_t = TGMS_FetchTween(_t);
	return is_undefined(_t) ? false : (_t[TWEEN.STATE] >= 0 || _t[TWEEN.STATE] == TWEEN_STATE.DELAYED);
}

/// @func	TweenIsPlaying(tween) : bool
/// @desc	Checks if tween is playing
function TweenIsPlaying(_t)
{
	_t = TGMS_FetchTween(_t);
	return is_undefined(_t) ? false : _t[TWEEN.STATE] >= 0;
}

/// @func	TweenIsPaused(tween) : bool
/// @desc	Checks if tween is paused
function TweenIsPaused(_t) 
{
	_t = TGMS_FetchTween(_t);
	return is_undefined(_t) ? false : _t[TWEEN.STATE] == TWEEN_STATE.PAUSED;
}

/// @func TweenIsResting(tween, <just?>) : bool
/// @desc Checks if tween is resting
function TweenIsResting(_t) 
{
	_t = TGMS_FetchTween(_t);
	if (is_array(_t)) { return _t[TWEEN.REST] < 0; }
}

/// @func	TweenJustStarted(tween) : bool
/// @desc	Checks if tween just started playing in current step
function TweenJustStarted(_t) 
{
	return ds_map_exists(global.TGMS_EventMaps[TWEEN_EV_PLAY], _t);
}

/// @func	TweenJustFinished(tween) : bool	
/// @desc	Checks to see if the tween just finished in current step
function TweenJustFinished(_t) 
{
	return ds_map_exists(global.TGMS_EventMaps[TWEEN_EV_FINISH], _t);
}
	
/// @func	TweenJustStopped(tween) : bool
///	@desc	Checks if tween just stopped in current step
function TweenJustStopped(_t) 
{
	return ds_map_exists(global.TGMS_EventMaps[TWEEN_EV_STOP], _t);
}

/// @func	TweenJustPaused(tween) : bool
/// @desc	Checks if tween was just paused in current step
function TweenJustPaused(_t) 
{
	return ds_map_exists(global.TGMS_EventMaps[TWEEN_EV_PAUSE], _t);
}

/// @func	TweenJustResumed(tween) : bool
/// @desc	Checks if tween was just resumed in current step
function TweenJustResumed(_t) 
{
	return ds_map_exists(global.TGMS_EventMaps[TWEEN_EV_RESUME], _t);
}

/// @func	TweenJustRested(tween) : bool
/// @desc	Checks if tween started to rest in current step
function TweenJustRested(_t) 
{
	return ds_map_exists(global.TGMS_EventMaps[TWEEN_EV_REST], _t);	
}

/// @func	TweenJustContinued(tween) : bool
/// @desc	Checks if tween just continued in current step
function TweenJustContinued(_t) 
{
	return ds_map_exists(global.TGMS_EventMaps[TWEEN_EV_CONTINUE], _t);
}

