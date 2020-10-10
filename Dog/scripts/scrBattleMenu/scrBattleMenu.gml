///@desc Create item descriptions and set default amount
function scrItems() {

	//ItemDescription[] - (Name, Desc, Thumbnail, Type, Execute Script) (SCRIPT, ARGUMENTS) (AMOUNT)
	//TYPE - 0 = Battle, 1 = Bag, 2 = Book
	var CurrentItem;

	enum Item
	{
	    GlovesOff,
	    PanAttack,
	    Chips,
	    BroomAttack,
	    Highfive,
	    LastItem
	}

	CurrentItem = Item.Chips;
	ItemExecute[CurrentItem] = [scrItemMiniGame, Game.Chips, 0, false];
	ItemDescription[CurrentItem] = ["Crunchy Chips", "A delicious treat", sEnemyalert, 1, ItemExecute[CurrentItem]];
	ds_map_add(oAreaStats.Items, CurrentItem, 3);

	CurrentItem = Item.GlovesOff;
	ItemExecute[CurrentItem] = [scrItemMiniGame, Game.GlovesOff, 10, true, true];
	ItemDescription[CurrentItem] = ["Gloves Off","Its Time",sEnemydownrun, 4, ItemExecute[CurrentItem]];
	ds_map_add(oAreaStats.Items, CurrentItem, -1);

	CurrentItem = Item.PanAttack;
	ItemExecute[CurrentItem] = [scrItemMiniGame, Game.PanAttack, 10, true, true];
	ItemDescription[CurrentItem] = ["Pan","Metal Pan",sEnemydownrun, 0, ItemExecute[CurrentItem]];
	ds_map_add(oAreaStats.Items, CurrentItem, -1);

	CurrentItem = Item.BroomAttack;
	ItemExecute[CurrentItem] = [scrItemMiniGame, Game.BroomAttack, 5, false, false];
	ItemDescription[CurrentItem] = ["Broom","Metal Pan",sEnemydownrun, 2, ItemExecute[CurrentItem]];
	ds_map_add(oAreaStats.Items, CurrentItem, -1);

	CurrentItem = Item.Highfive;
	ItemExecute[CurrentItem] = [scrSameScreenMiniGame, Game.Highfive];
	ItemDescription[CurrentItem] = ["Broom","Metal Pan",sEnemydownrun, 4, ItemExecute[CurrentItem]];


}

/// @param GameType
/// @param Cost = 0
/// @param EndTurn = true
/// @param ShowEnemy = false;
function scrItemMiniGame() {
	var GameType = argument[0];
	var Cost = argument_count > 1 ? argument[1] : 0;
	var EndTurn = argument_count > 2 ? argument[2] : true;
	var ShowEnemy = argument_count > 3 ? argument[3] : false;;

	var MiniGame = instance_create_layer(0,0,"GameManager",oMiniGame);
	MiniGame.GameType = GameType;
	global.PlayerPP = clamp(global.PlayerPP-Cost, 0, global.PlayerMaxPP);
	MiniGame.ShowEnemy = ShowEnemy;
	MiniGame.EndTurn = EndTurn;
}

/*
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
*/

/// @param GameType
function scrSameScreenMiniGame(argument0) {
	var GameType = argument0;

	var MiniGame = instance_create_layer(0,0,"GameManager",oMiniGame);
	MiniGame.GameType = GameType;
	MiniGame.EndTurn = false;
}

function scrMiniGameIcon(Sprite)
{
	if(!instance_exists(oIconPopup))
	{
		var Icon = instance_create_layer(room_width/2, room_height/2, "TextBox", oIconPopup);
		Icon.Sprite = Sprite;
	}
}
