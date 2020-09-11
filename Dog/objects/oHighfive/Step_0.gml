
ImageIndex += ImageSpeed;
if(ceil(ImageIndex) > sprite_get_number(sHandClap) && CanAttempt)
{
    CanAttempt = false;
    oMiniGame.timer[1] = 0.1*60;
    ImageSpeed = 0;
}
ImageIndex = ImageIndex % (sprite_get_number(sHandClap));

if(CanAttempt && global.KeyInteract)
{
    if(ceil(ImageIndex) == sprite_get_number(sHandClap))
    {
        oBattleManager.NeglectMeter = 0;
        scrMiniGameIcon(sCheckMark);
    }
    
    CanAttempt = false;
    ImageSpeed = 0;
    oMiniGame.timer[1] = 0.5*60;
}
