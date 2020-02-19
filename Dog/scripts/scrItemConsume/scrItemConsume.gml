
var BattleText = instance_create_layer(x,y,"text",oBattleTextBox);
var Text = argument1;

global.phealth += argument0;
BattleText.text = [Text];

ds_map_replace(ItemAmount, ItemMouseHoverSelect, ds_map_find_value(ItemAmount, ItemMouseHoverSelect)-1);