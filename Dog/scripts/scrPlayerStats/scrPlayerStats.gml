
global.plevel = 1;
global.phealth = 50;
global.pmaxhealth = 50;
global.poffense = 1;
global.pdefense = 1;
global.xp = 0;
global.maxexp = 100;
global.pp = 15;

//Load Variables from ds map if available
var SaveVal = ds_map_find_value(oAreaStats.SaveState,"PlayerHealth");
if(SaveVal != undefined)
{
	global.plevel = ds_map_find_value(oAreaStats.SaveState,"PlayerLevel");
    global.phealth = ds_map_find_value(oAreaStats.SaveState,"PlayerHealth");
    global.pp = ds_map_find_value(oAreaStats.SaveState,"PlayerPP");
}
