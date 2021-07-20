/// @description Insert description here
// You can write your code in this editor

// Create partners
for(var i=0; i<array_length(global.PartnerArray);i++)
{
	var Partner = array_get(global.PartnerArray, i);
	if(Partner != -1 && !instance_exists(Partner))
		instance_create_layer(x, y, "Instances", Partner);
}