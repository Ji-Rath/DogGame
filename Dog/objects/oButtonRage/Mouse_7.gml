
if(visible)
{
    //Execute Dogpaddler special mode
    with(oBattleManager)
    {
        var ItemDesc = ItemDescription[Item.GlovesOff];
        var ExecuteArray = ItemDesc[4];
        script_execute(ExecuteArray[0],ExecuteArray[1],ExecuteArray[2],ExecuteArray[3],ExecuteArray[4]);
        with(oBattleMenuParent)
        {
            visible = false;
            Selected = false;
        }
        oBattleManager.visible = false;
        oBattleManager.BattleTimer = 0;
        oBattleManager.DrawTimer = 0;
        Selected = false;
        
        //Increase rage
        oBattleManager.RageMeter = 0;
    }
}