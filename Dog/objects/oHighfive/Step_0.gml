
ImageIndex += ImageSpeed;
if(ceil(ImageIndex) > sprite_get_number(sHandClap) && CanAttempt)
{
    CanAttempt = false;
    scrFinishMiniGame(false);
    ImageSpeed = 0;
}
ImageIndex = ImageIndex % (sprite_get_number(sHandClap));

if(CanAttempt && global.KeyInteract)
{
    if(ceil(ImageIndex) > IndexCorrectMin && ceil(ImageIndex) < IndexCorrectMax)
    {
        oBattleManager.NeglectMeter = 0;
        scrFinishMiniGame(true);
    }
	else
	{
		scrFinishMiniGame(false);
	}
	
    CanAttempt = false;
    ImageSpeed = 0;
}
