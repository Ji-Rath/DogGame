//Collision

if(!HitObject)
{
	scrFinishMiniGame(false);
	
	DogSave.phy_rotation = 0;
	global.PlayerHP -= 10;
	HitObject = true;
	DogSave.sprite_index = sSmush;
	
	with(oCamera)
		ScreenShake(20, 15);
}
