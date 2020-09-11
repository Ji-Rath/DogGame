if(oBattleManager.DrawGUI && !instance_exists(oMiniGame))
{
	scrPlaySequence(seqIconPress);
	
    //Disable other Menu's
    with(oBattleMenuBase)
    {
        if(id != other.id)
            Selected = false;
    }
    
    //Reverse clicked Menu State
    Selected = !Selected;
}
