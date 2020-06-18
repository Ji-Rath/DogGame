
scrAnimStep();

//Make fist visible only when available and GUI is visible
if(oBattleManager.RageMeter >= 3 && oBattleMenuParent.visible)
{
    visible = true;
    if(CanPlayAnim)
    {
        scrAnimInit(Animation.Flip, AnimationIntro.Intro1);
        CanPlayAnim = false;
    }
}
else
{
    visible = false;
    CanPlayAnim = true;
}