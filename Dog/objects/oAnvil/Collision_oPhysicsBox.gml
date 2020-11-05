//Collision

if(!HitObject)
{
	scrFinishMiniGame(true);
	HitObject = true;
	
	with(oCamera)
		ScreenShake(20, 15);
}