
scrGameLoad(oAreaStats.CurrentSave);

var Room = ds_map_find_value(oAreaStats.SaveState,"Room");
if(Room != undefined && room_get_name(room) != Room)
{
    scrFadeout(asset_get_index(Room),c_black,0.05);
}