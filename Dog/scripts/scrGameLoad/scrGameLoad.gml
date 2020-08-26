function scrGameLoad(argument0) {
	
	//Read from save-file
	ini_open("GameSave.sav");
	var LoadSave = ini_read_string("Saves",argument0,undefined);
	ini_close();
	
	//Access ds map if successfully loaded save
	if(LoadSave != undefined)
	{
	    ds_map_read(oAreaStats.SaveState,LoadSave);
	}
}
