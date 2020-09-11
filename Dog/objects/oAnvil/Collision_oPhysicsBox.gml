//Collision

if(!HitObject)
{
	if(oMiniGame.timer[1] > 0.5*60)
		oMiniGame.timer[1] = 0.5*60;
	DealEnemyDamage = true;

	var Icon = instance_create_layer(room_width/2, room_height/2, "GUI", oIconPopup);
	Icon.Sprite = sCheckMark;
	
	HitObject = true;
}