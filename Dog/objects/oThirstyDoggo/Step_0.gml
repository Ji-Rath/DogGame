/// @description Insert description here
// You can write your code in this editor


if (!bFinishedGame && HydrationLevel >= HydrationNeeded)
{
	scrFinishMiniGame(true);
	bFinishedGame = true;
	oHand.bGrabbed = false;
	
	/** Destroy any liquid particles */
	physics_particle_delete_region_box(room_width/2, room_height/2, 1000, 1000);
}

if (image_index >= MouthOpenIndex)
	image_speed = 0;

//physics_particle_delete_region_box(x, y, abs(bbox_left - bbox_right), abs(bbox_top - bbox_bottom));
	