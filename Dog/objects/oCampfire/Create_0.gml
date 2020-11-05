/// @description Insert description here
// You can write your code in this editor

WindNeeded = 15; //Wind needed to complete the minigame
WindDecreaseRate = 3; //Wind lost each second

/////////////////////////////////////////////////////////////////////////////////

WindCount = 0;
image_speed = 0;
alarm[0] = 1*60;

/// @desc Increase wind, check if campfire is ignited
function IncreaseWind(Count)
{
	WindCount += Count;
	image_speed = 1;
	
	if (WindCount >= WindNeeded)
		scrFinishMiniGame(true);
}