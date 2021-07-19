// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

/// @todo refactor to support new saving system
function RemoveInstance(Object, InstanceID)
{
	SetVariableValue(Object, InstanceID, "Health", 0, 1);
}