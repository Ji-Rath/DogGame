/// @description Insert description here
// You can write your code in this editor

event_inherited();

if (oBattleManager.DrawGUI)
{
    //Execute highfive minigame
    with(oBattleManager)
    {
        var ItemDesc = ItemDescription[Item.Highfive];
        var ExecuteArray = ItemDesc[4];
        script_execute(ExecuteArray[0],ExecuteArray[1]);
        DrawGUI = false;
    }
	AllyRef.bMiniGameWait = true;
}