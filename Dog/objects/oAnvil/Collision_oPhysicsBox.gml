//Collision

if(!HitObject)
{
	if(oMiniGame.timer[1] > 0.5*60)
		oMiniGame.timer[1] = 0.5*60;
	DealEnemyDamage = true;

	scrMiniGameIcon(sCheckMark);
	
	HitObject = true;
	
	with(oCamera)
		ScreenShake(20, 15);
}