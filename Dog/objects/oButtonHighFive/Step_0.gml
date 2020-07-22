
scrAnimStep();

visible = (oBattleManager.DrawGUI && oBattleManager.NeglectMeter >= MaxNeglect);
show_debug_message(string(oBattleManager.DrawGUI));

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