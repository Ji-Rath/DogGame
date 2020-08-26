
event_inherited();

scrGameLoad(SaveName);

var Room = ds_map_find_value(oAreaStats.SaveState,"Room");
if(Room != undefined && room_get_name(room) != Room)
{
    ButtonText += " - "+Room;
}
else
{
    ButtonText += " - Empty";
}
