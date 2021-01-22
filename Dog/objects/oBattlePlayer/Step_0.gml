/// @description Insert description here
// You can write your code in this editor

event_inherited();

var Increment = 0.25;
//Check player health for changes
DisplayHealth += Increment*sign(global.PlayerHP-DisplayHealth);
	
//Check player PP for changes
DisplayPP += Increment*sign(global.PlayerPP-DisplayPP);

if(!instance_exists(oButtonRage) && Rage >= MaxRage)
{
	var RageButton = instance_create_layer(x, y, "GUI", oButtonRage);
	RageButton.AllyRef = self;
}