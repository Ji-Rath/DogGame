//Collision

if(!HitObject)
{
	scrFinishMiniGame(false);
	
	global.PlayerHP -= 10;
	HitObject = true;
	DogSave.sprite_index = sSmush;
	
	with(oCamera)
		ScreenShake(20, 15);
}
