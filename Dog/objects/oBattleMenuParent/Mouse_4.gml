
//Disable other Menu's
with(oBattleMenuParent)
{
    if(id != other.id)
    {
        Selected = false;
    }
}

//Reverse clicked Menu State
Selected = !Selected;