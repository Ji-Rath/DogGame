/// @description Insert description here
// You can write your code in this editor

var Increment = 0.25;
//Check player health for changes
DisplayHealth += Increment*sign(global.PlayerHP-DisplayHealth);
	
//Check player PP for changes
DisplayPP += Increment*sign(global.PlayerPP-DisplayPP);