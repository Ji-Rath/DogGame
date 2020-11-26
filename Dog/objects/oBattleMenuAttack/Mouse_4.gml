/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

//Go straight to attacking with attack button
if (CanPress() && alarm[0] == -1)
{
	ItemMouseHoverSelect = ds_list_find_value(Contents,0);
	alarm[0] = 0.3*60/oBattleManager.SpeedMultiplier;
		
	//Fade out GUI icons
	with(oBattleMenuBase)
	{
		scrAnimReinit(Animations.Flip, Animations.FadeOut);
		Selected = false;
	}
		
	with(oBattleManager)
		DrawGUI = false;
}
