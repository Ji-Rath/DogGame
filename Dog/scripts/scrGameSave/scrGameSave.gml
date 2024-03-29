/// @param SaveName
/// @param Room = room
var SaveName = argument[0];
var Room = argument_count > 1 ? argument[1] : room;

//Save Player position
with(oDogPaddler)
{
    ds_map_replace(oAreaStats.SaveState,"PlayerX",x);
    ds_map_replace(oAreaStats.SaveState,"PlayerY",y);
}

//Save Player Stats
ds_map_replace(oAreaStats.SaveState,"PlayerHealth",global.PlayerHP);
ds_map_replace(oAreaStats.SaveState,"PlayerPP",global.PlayerPP);
ds_map_replace(oAreaStats.SaveState,"PlayerLevel",global.PlayerLevel);

//Save Room
ds_map_replace(oAreaStats.SaveState,"Room",room_get_name(Room));

//Save Items
ds_map_replace(oAreaStats.SaveState,"Items",ds_map_write(oAreaStats.Items));

//Save Enemy State
var Enemy = ds_grid_create(4,0);
var KeyName = room_get_name(Room)+"Enemy";
with(oEnemyParent)
{
    ds_grid_resize(Enemy,ds_grid_width(Enemy),ds_grid_height(Enemy)+1);
    var row = ds_grid_height(Enemy)-1;
    ds_grid_add(Enemy,0,row,Key);
    ds_grid_add(Enemy,1,row,x);
    ds_grid_add(Enemy,2,row,y);
    ds_grid_add(Enemy,3,row,Health);
}
ds_map_replace(oAreaStats.SaveState,KeyName,ds_grid_write(Enemy));

//Save Trigger State
var Trigger = ds_grid_create(2,0);
var KeyName = room_get_name(Room)+"Trigger";
with(oTriggerParent)
{
    ds_grid_resize(Trigger,ds_grid_width(Trigger),ds_grid_height(Trigger)+1);
    var row = ds_grid_height(Trigger)-1;
    ds_grid_add(Trigger,0,row,Key);
    ds_grid_add(Trigger,1,row,Used);
}
with(oNPCParent)
{
    ds_grid_resize(Trigger,ds_grid_width(Trigger),ds_grid_height(Trigger)+1);
    var row = ds_grid_height(Trigger)-1;
    ds_grid_add(Trigger,0,row,Key);
    ds_grid_add(Trigger,1,row,Used);
}
ds_map_replace(oAreaStats.SaveState,KeyName,ds_grid_write(Trigger));

//Save ds map to file
var SaveText = ds_map_write(oAreaStats.SaveState);
ini_open("GameSave.sav");
ini_write_string("Saves",SaveName,SaveText);
ini_close();