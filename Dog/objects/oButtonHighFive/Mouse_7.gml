
if(visible && scrAnimVisible())
{
    //Execute highfive minigame
    with(oBattleManager)
    {
        var ItemDesc = ItemDescription[Item.Highfive];
        var ExecuteArray = ItemDesc[4];
        script_execute(ExecuteArray[0],ExecuteArray[1]);
        DrawGUI = false;
    }
    CanHighfive = false;
}