/// @description Execute Item Script

var ContentArray = oBattleManager.ItemDescription[ItemMouseHoverSelect];
var ExecuteArray = ContentArray[4];
scrExecuteAlt(ExecuteArray);

//Fade out GUI icons
with(oBattleMenuBase)
{
	Selected = false;
	scrAnimReinit(-1, Animations.FadeOut);
}
		
with(oBattleManager)
	DrawGUI = false;