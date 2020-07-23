
scrAnimStep();

visible = (CanHighfive && oBattleManager.DrawGUI && oBattleManager.NeglectMeter >= MaxNeglect);

//Make fist visible only when available and GUI is visible
if (visible)
{
    if(CanPlayAnim)
    {
        scrAnimInit(Animation.Flip, AnimationIntro.Intro1);
        CanPlayAnim = false;
    }
}
else
{
    CanPlayAnim = true;
}