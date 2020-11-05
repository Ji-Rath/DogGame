/// @description Insert description here
// You can write your code in this editor


if (!bFinishedGame && HydrationLevel >= HydrationNeeded)
{
	scrFinishMiniGame(true);
	bFinishedGame = true;
}

physics_particle_delete_region_box(x, y, abs(bbox_left - bbox_right), abs(bbox_top - bbox_bottom));
	