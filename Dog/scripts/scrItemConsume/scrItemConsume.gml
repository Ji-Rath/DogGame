/// @param Text
/// @param Health
var Health = argument0, Text = argument1;

//Create Battle TextBox
scrCreateBattleBox(Text);

//Change player health
global.phealth += Health;

//Update item amount
ds_map_replace(oAreaStats.Items, ItemMouseHoverSelect, ds_map_find_value(oAreaStats.Items, ItemMouseHoverSelect)-1);