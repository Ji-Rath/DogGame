/// @description Insert description here
// You can write your code in this editor
event_inherited();

if(oBattleManager.DrawGUI)
{
    //Execute Dogpaddler special mode
    with(oBattleManager)
    {
        var ItemDesc = ItemDescription[Item.GlovesOff];
        var ExecuteArray = ItemDesc[4];
        scrExecuteAlt(ExecuteArray);
		
		with(oBattleMenuBase)
		{
			TweenPlay(FadeOut);
			Selected = false;
		}
		
	    with(oBattleManager)
			DrawGUI = false;
		
		with(oBattleCharBase)
			TweenPlay(FadeOut);
        
        //Reset rage meter
        oBattlePlayer.Rage = 0;
    }
}