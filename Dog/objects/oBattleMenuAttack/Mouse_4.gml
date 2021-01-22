/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

//Go straight to attacking with attack button
if (CanPress())
{
	ItemMouseHoverSelect = ds_list_find_value(Contents,0);
	alarm[0] = 0.3*60*oBattleManager.SpeedMultiplier;
	Selected = false; //Prevent hidden menu from showing!
}
