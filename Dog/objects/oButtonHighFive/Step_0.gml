
scrAnimStep();

visible = (CanHighfive && oBattleManager.DrawGUI && oBattleManager.NeglectMeter >= MaxNeglect && !instance_exists(oMiniGame));

//Make fist visible only when available and GUI is visible
if (visible)
{
    if(CanPlayAnim)
    {
        scrAnimInit(Animations.Flip, Animations.FadeIn);
        CanPlayAnim = false;
    }
}
else
{
    CanPlayAnim = true;
}