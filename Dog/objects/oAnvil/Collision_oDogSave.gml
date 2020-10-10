//Collision

if(!HitObject)
{
	scrFinishMiniGame(false);
	
	global.PlayerHP -= 10;
	HitObject = true;
	
	with(oCamera)
		ScreenShake(20, 15);
}
