/// @description Insert description here
// You can write your code in this editor

SunscreenNeeded = 40;
image_speed = 0;



//////////////////////////////////////////////////////////////////////////
bCompleted = false;
SunscreenList = ds_list_create();

cursor_sprite = sHand;

function SunscreenCollision(SunscreenID)
{
	/** add collided sunscreen to list if it does not exist already */
	if (!ds_list_find_index(SunscreenList, SunscreenID))
		ds_list_add(SunscreenList, SunscreenID);
	
	if (!bCompleted && ds_list_size(SunscreenList) >= SunscreenNeeded)
	{
		bCompleted = true;
		scrFinishMiniGame(true);
		image_speed = 1;
		
		with (oSunscreen)
			instance_destroy();
	}	
}