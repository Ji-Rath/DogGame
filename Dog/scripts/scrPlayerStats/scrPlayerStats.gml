function scrPlayerStats() {

	global.PlayerLevel = 1;
	global.PlayerHP = 50;
	global.PlayerMaxHP = 50;
	global.PlayerOffense = 1;
	global.PlayerDefense = 1;
	global.XP = 0;
	global.MaxXP = 100;
	global.PlayerPP = 15;
	global.PlayerMaxPP = 30;

	global.WizardHappy = 50;
	
	global.PartnerArray = [oArtGirl, oMissileBoy, oWitchGirl];
}

function scrUpdateStats()
{
	//Load Variables from ds map if available
	var SaveVal = ds_map_find_value(oAreaStats.SaveState,"PlayerHealth");
	if(SaveVal != undefined)
	{
		global.PlayerLevel = ds_map_find_value(oAreaStats.SaveState,"PlayerLevel");
	    global.PlayerHP = ds_map_find_value(oAreaStats.SaveState,"PlayerHealth");
	    global.PlayerPP = ds_map_find_value(oAreaStats.SaveState,"PlayerPP");
	}
}
