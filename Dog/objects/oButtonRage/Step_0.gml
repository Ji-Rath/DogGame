
scrAnimStep();

//Make fist visible only when available and GUI is visible
if(oBattleManager.RageMeter >= MaxRage && oBattleManager.DrawGUI && !instance_exists(oMiniGame))
{
    visible = true;
    if(CanPlayAnim)
    {
        scrAnimInit(Animations.Flip, Animations.FadeIn);
        CanPlayAnim = false;
    }
}
else
{
    visible = false;
    CanPlayAnim = true;
}