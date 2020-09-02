
scrAnimStep();

visible = (CanHighfive && oBattleManager.BattleStage == 3 && oBattleManager.NeglectMeter >= MaxNeglect && !instance_exists(oMiniGame));

//Make fist visible only when available and GUI is visible
if (visible)
{
    if(CanPlayAnim)
    {
        scrAnimInit(Animations.Flip, Animations.IntroScale);
        CanPlayAnim = false;
    }
}
else
{
    CanPlayAnim = true;
}