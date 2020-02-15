///scrGameSave(SaveFile);

//Save Player position
with(oDogPaddler)
{
    ds_map_replace(oAreaStats.SaveState,"PlayerX",x);
    ds_map_replace(oAreaStats.SaveState,"PlayerY",y);
}

//Save Player Stats
ds_map_replace(oAreaStats.SaveState,"PlayerHealth",global.phealth);
ds_map_replace(oAreaStats.SaveState,"PlayerPP",global.pp);
ds_map_replace(oAreaStats.SaveState,"PlayerLevel",global.plevel);

//Save Room
ds_map_replace(oAreaStats.SaveState,"Room",room_get_name(room));

//Save Enemy State
var Enemy = ds_grid_create(4,0);
var KeyName = room_get_name(room)+"Enemy";
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

//Save ds map to file
var SaveText = ds_map_write(oAreaStats.SaveState);
ini_open("GameSave.sav");
ini_write_string("Saves",argument0,SaveText);
ini_close();