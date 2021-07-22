
event_inherited();

LoadGame(SaveName);

var Room = ds_map_find_value(oAreaStats.SaveState,"Room");
if(Room != undefined && room_get_name(room) != Room)
{
    ButtonText += " - "+room_get_name(Room);
}
else
{
    ButtonText += " - Empty";
}
