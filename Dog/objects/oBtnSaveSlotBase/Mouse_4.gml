
//Load saved game, if it doesnt exist, create a new save
scrGameLoad(SaveName);

var Room = ds_map_find_value(oAreaStats.SaveState,"Room");
if(!oAreaStats.LoadGame)
{
    ds_map_clear(oAreaStats.SaveState);
    scrFadeout(rmHouse,c_black,0.05);
    oAreaStats.CurrentSave = SaveName;
}
else if(Room != undefined && room_get_name(room) != Room)
{
    scrFadeout(asset_get_index(Room),c_black,0.05);
    oAreaStats.CurrentSave = SaveName;
}