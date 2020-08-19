/// @param Text
/// @param Health
function scrItemConsume(argument0, argument1) {
	var Health = argument0, Text = argument1;

	//Create Battle TextBox
	scrCreateBattleBox(Text, false);

	//Change player health
	global.PlayerHP += Health;

	//Update item amount
	ds_map_replace(oAreaStats.Items, ItemMouseHoverSelect, ds_map_find_value(oAreaStats.Items, ItemMouseHoverSelect)-1);


}
