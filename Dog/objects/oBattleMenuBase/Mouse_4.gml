if(CanPress())
{
    //Disable other Menu's
    with(oBattleMenuBase)
    {
        if(id != other.id)
            Selected = false;
    }
    
    //Reverse clicked Menu State
    Selected = !Selected;
}
