//Items - (NAME, DESC, SPRITE, TYPE) (SCRIPT, ARGUMENTS) (AMOUNT)
var CurrentItem;

CurrentItem = Item.Hamburger;
ItemDescription[CurrentItem] = ["Hamburger","A delicious treat",sEnemyalert, 1];
ItemContent[CurrentItem] = [scrItemConsume,10,"You eat the tasty burger"];
ds_map_replace(oAreaStats.Items, CurrentItem, 3);

CurrentItem = Item.GlovesOff;
ItemDescription[CurrentItem] = ["Gloves Off","Its Time",sEnemydownrun, 0];
ItemContent[CurrentItem] = [scrItemMiniGame,10];
ds_map_replace(oAreaStats.Items, CurrentItem, 1);


//If there are item amounts on file, load them
var Items = ds_map_find_value(oAreaStats.SaveState, "Items");
if(Items != undefined)
{
    ItemAmount = Items;
}