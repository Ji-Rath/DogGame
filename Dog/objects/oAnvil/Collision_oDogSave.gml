//Collision

if(!HitObject)
{
	if(oMiniGame.timer[1] > 0.5*60)
	oMiniGame.timer[1] = 0.5*60;
	DealEnemyDamage = false;
	global.PlayerHP -= 10;
	HitObject = true;
}
