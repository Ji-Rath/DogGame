/// @desc Initialize v2.0.0
/*
	Proverbs 3:5-8
	Trust in the Lord with all your heart and lean not on your own understanding;
	in all your ways submit to him, and he will make your paths straight.
	Do not be wise in your own eyes; fear the Lord and shun evil.
	This will bring health to your body and nourishment to your bones.
*/

//frame = 0; // This is for delaying any immediate calls... not a final name

// Make sure one isn't deactivated
instance_activate_object(o_SharedTweener);
// Destroy self if there ALREADY is a shared tweener out there
if (instance_exists(global.TGMS_SharedTweener))
{
	instance_destroy();
	exit;
}

// Clean previous shared tweener environment
if (global.TGMS_SharedTweener != noone)
{
	event_user(15);
}

// Mark self as the global shared tweener
global.TGMS_SharedTweener = id;

// Try to evade deactivation regions!
x = -100000;
y = -100000;

//-----------------------------------------------
// Declare Default Global System-Wide Settings
//-----------------------------------------------
global.TGMS_IsEnabled = true;         // System's active state boolean
global.TGMS_TimeScale = 1.0;          // Effects overall speed of how fast system plays tweens/delays
global.TGMS_MinDeltaFPS = 10;         // The lowest framerate before delta tweens will begin to lag behind (Ideally, keep between 10-15)
global.TGMS_UpdateInterval = 1.0;     // Sets how often (in steps) system will update (1 = default, 2 = half speed, 0.5 = double speed) DO NOT set as 0 or below!
global.TGMS_AutoCleanIterations = 10; // Limits, each step, number of tweens passively checked by memory manager (Default:10)
global.TGMS_EasyUseDelta = false;	  // Simple tweens use delta time?
global.TGMS_TweensIncludeDeactivated = false; // Whether or not to include tween's associated with deactivated targets when selecting tweens
global.TGMS_GroupScales[? 0] = 1;

//-------------------------------------------------
// Initiate Tween Index Supplier And Reference Map
//-------------------------------------------------
global.TGMS_TweenIndex = 1;

//---------------------------
// Create Default Tween
//---------------------------
global.TGMS_TweenDefault[TWEEN.ID] = TWEEN_DEFAULT;
global.TGMS_TweenDefault[TWEEN.TARGET] = noone;
global.TGMS_TweenDefault[TWEEN.EASE] = CurveLinear;
global.TGMS_TweenDefault[TWEEN.TIME] = 0;
global.TGMS_TweenDefault[TWEEN.DURATION] = 1;
global.TGMS_TweenDefault[TWEEN.PROPERTY_DATA_RAW] = -1;
global.TGMS_TweenDefault[TWEEN.STATE] = TWEEN_STATE.STOPPED;
global.TGMS_TweenDefault[TWEEN.SCALE] = 1;
global.TGMS_TweenDefault[TWEEN.DELTA] = false;
global.TGMS_TweenDefault[TWEEN.GROUP] = 0;
global.TGMS_TweenDefault[TWEEN.EVENTS] = -1;
global.TGMS_TweenDefault[TWEEN.DESTROY] = 1;
global.TGMS_TweenDefault[TWEEN.DIRECTION] = 1;
global.TGMS_TweenDefault[TWEEN.MODE] = TWEEN_MODE_ONCE;
global.TGMS_TweenDefault[TWEEN.PROPERTY_DATA] = 0;
global.TGMS_TweenDefault[TWEEN.DELAY] = 0; // Is there a reason this is negative 1 by default? IS THERE?????
global.TGMS_TweenDefault[TWEEN.DELAY_START] = 0;
global.TGMS_TweenDefault[TWEEN.AMOUNT] = 0;
global.TGMS_TweenDefault[TWEEN.CALLER] = noone;
global.TGMS_TweenDefault[TWEEN.REST] = 0;
global.TGMS_TweenDefault[TWEEN.CONTINUE_COUNT] = -1;
global.TGMS_TweenDefault[TWEEN.EASE_RAW] = 0;
	
//-------------------------------------------------
// Assign default tween as [1] in index map
//-------------------------------------------------
global.TGMS_TweenIndexMap[? 1] = global.TGMS_TweenDefault;
//---------------------------------------------------
// Assign [all] as shortcut for affecting all tweens
//---------------------------------------------------
global.TGMS_TweenIndexMap[? all] = {target: all};

// Global system-wide settings
isEnabled = global.TGMS_IsEnabled;                     // System's active state flag
timeScale = global.TGMS_TimeScale;                     // Global time scale of tweening engine
minDeltaFPS = global.TGMS_MinDeltaFPS;                 // Minimum frame rate before delta time will lag behind
updateInterval = global.TGMS_UpdateInterval;           // Step interval to update system (default = 1)
autoCleanIterations = global.TGMS_AutoCleanIterations; // Number of tweens to check each step for auto-cleaning
groupScales = global.TGMS_GroupScales;

// System maintenance variables
tick = 0;									// System update timer
autoCleanIndex = 0;							// Used to track index when processing passive memory manager
maxDelta = 1/minDeltaFPS;					// Cache delta cap
deltaTime = 1/game_get_speed(gamespeed_fps);// Let's make delta time more practical to work with, shall we?
prevDeltaTime = deltaTime;					// Holds delta time from previous step
deltaRestored = false;						// Used to help maintain predictable delta timing
addDelta = 0.0;								// Amount to add to delta time if update interval not reached
flushDestroyed = false;						// Flag to indicate if destroyed tweens should be immediately cleared
tweensProcessNumber = 0;					// Number of tweens to be actively processed in update loop
delaysProcessNumber = 0;					// Number of delays to be actively processed in update loop
inUpdateLoop = false;						// Is tweening system actively processing tweens?

// Required data structures
tweens = ds_list_create();           // Stores automated step tweens
delayedTweens = ds_list_create();    // Stores tween delay data
pRoomTweens = ds_map_create();       // Associates persistent rooms with stored tween lists
pRoomDelays = ds_map_create();       // Associates persistent rooms with stored tween delay lists
eventCleaner = ds_priority_create(); // Used to clean callbacks from events
stateChanger = ds_queue_create();	 // Used to delay change of tween state when in the update loop

// These are used to clean up the system after Shared Tweener is already gone
global.TGMS.tweens = tweens;
global.TGMS.delayedTweens = delayedTweens;
global.TGMS.pRoomTweens = pRoomTweens;
global.TGMS.pRoomDelays = pRoomDelays;
global.TGMS.eventCleaner = eventCleaner;
global.TGMS.stateChanger = stateChanger;

// Set defaults for TWEEN USER properties
TWEEN_USER_GET = 0;
TWEEN_USER_VALUE = 0;
TWEEN_USER_DATA = undefined;
TWEEN_USER_TARGET = noone;


// Define Methods
function EaseSwap(_t)
{
	// SWAP DURATION //
	if (is_array(_t[TWEEN.DURATION_RAW]))
	{
		if (_t[TWEEN.DURATION] == _t[@ TWEEN.DURATION_RAW][0])
		{
			_t[@ TWEEN.DURATION] = _t[@ TWEEN.DURATION_RAW][1];
			// NOTE: This silently updates the internal time value... be careful!
			
			if (_t[TWEEN.MODE] <= TWEEN_MODE_PATROL)
			{
				_t[@ TWEEN.TIME] += _t[@ TWEEN.DURATION_RAW][1] - _t[@ TWEEN.DURATION_RAW][0];
			}
		}
		else
		{
			_t[@ TWEEN.DURATION] = _t[@ TWEEN.DURATION_RAW][0];
		}
	}
	
	// SWAP EASE ALGORITHM //
	if (is_array(_t[TWEEN.EASE_RAW]))
	{
		// Deal with method ease
		if (is_method(_t[TWEEN.EASE]))
		{
			if (is_method(_t[TWEEN.EASE_RAW][0]))
			{
				if (method_get_index(_t[TWEEN.EASE]) == method_get_index(_t[TWEEN.EASE_RAW][0]))
				{
					_t[@ TWEEN.EASE] = _t[@ TWEEN.EASE_RAW][1];
				}
				else
				{
					_t[@ TWEEN.EASE] = _t[@ TWEEN.EASE_RAW][0];
				}
			}
			else
			{
				if (method_get_index(_t[TWEEN.EASE]) == _t[TWEEN.EASE_RAW][0])
				{
					_t[@ TWEEN.EASE] = _t[@ TWEEN.EASE_RAW][1];
				}
				else
				{
					_t[@ TWEEN.EASE] = _t[@ TWEEN.EASE_RAW][0];
				}
			}
		}
		else // animation channel
		{
			if (is_method(_t[TWEEN.EASE_RAW][0]))
			{
				if (_t[TWEEN.EASE] == method_get_index(_t[TWEEN.EASE_RAW][0]))
				{
					_t[@ TWEEN.EASE] = _t[@ TWEEN.EASE_RAW][1];
				}
				else
				{
					_t[@ TWEEN.EASE] = _t[@ TWEEN.EASE_RAW][0];
				}
			}
			else
			{
				if (_t[TWEEN.EASE] == _t[TWEEN.EASE_RAW][0])
				{
					_t[@ TWEEN.EASE] = _t[@ TWEEN.EASE_RAW][1];
				}
				else
				{
					_t[@ TWEEN.EASE] = _t[@ TWEEN.EASE_RAW][0];
				}
			}
		}
	}
}
