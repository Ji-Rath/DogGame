
//Load saved game, if it doesnt exist, create a new save
scrGameLoad(SaveName);

var Room = ds_map_find_value(oAreaStats.SaveState,"Room");
if(!oAreaStats.LoadGame)
{
    ds_map_clear(oAreaStats.SaveState);
    scrFadeout(rmSceneDogHut, seqCircleTransition);
    oAreaStats.CurrentSave = SaveName;
}
else if(Room != undefined && room_get_name(room) != Room)
{
    scrFadeout(asset_get_index(Room), seqCircleTransition);
    oAreaStats.CurrentSave = SaveName;
}