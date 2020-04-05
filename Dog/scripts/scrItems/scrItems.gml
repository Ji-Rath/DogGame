///@desc Create item descriptions and set default amount

//ItemDescription[] - (Name, Desc, Thumbnail, Type, Execute Script) (SCRIPT, ARGUMENTS) (AMOUNT)
//TYPE - 0 = Battle, 1 = Bag, 2 = Book
var CurrentItem;

CurrentItem = Item.Hamburger;
ItemExecute[CurrentItem] = [scrItemMiniGame, Game.Chips, 10, false];
ItemDescription[CurrentItem] = ["Hamburger", "A delicious treat", sEnemyalert, 1, ItemExecute[CurrentItem]];
ds_map_add(oAreaStats.Items, CurrentItem, 3);

CurrentItem = Item.GlovesOff;
ItemExecute[CurrentItem] = [scrItemMiniGame, Game.GlovesOff, 10, true, true];
ItemDescription[CurrentItem] = ["Gloves Off","Its Time",sEnemydownrun, 0, ItemExecute[CurrentItem]];
ds_map_add(oAreaStats.Items, CurrentItem, 0);

CurrentItem = Item.PanAttack;
ItemExecute[CurrentItem] = [scrItemMiniGame, Game.PanAttack, 10, true, true];
ItemDescription[CurrentItem] = ["Pan","Metal Pan",sEnemydownrun, 0, ItemExecute[CurrentItem]];
ds_map_add(oAreaStats.Items, CurrentItem, 1);