///@desc Create item descriptions and set default amount

//Items - (NAME, DESC, SPRITE, TYPE) (SCRIPT, ARGUMENTS) (AMOUNT)
var CurrentItem;

CurrentItem = Item.Hamburger;
ItemDescription[CurrentItem] = ["Hamburger","A delicious treat",sEnemyalert, 1];
ItemContent[CurrentItem] = [scrItemConsume,10,["You eat the tasty burger"]];
ds_map_add(oAreaStats.Items, CurrentItem, 3);

CurrentItem = Item.GlovesOff;
ItemDescription[CurrentItem] = ["Gloves Off","Its Time",sEnemydownrun, 0];
ItemContent[CurrentItem] = [scrItemMiniGame,10];
ds_map_add(oAreaStats.Items, CurrentItem, 1);