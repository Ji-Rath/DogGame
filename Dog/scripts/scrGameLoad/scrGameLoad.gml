
ini_open("GameSave.sav");
var LoadSave = ini_read_string("Saves",argument0,undefined);
ini_close();

if(LoadSave != undefined)
{
    ds_map_read(oAreaStats.SaveState,LoadSave);
}