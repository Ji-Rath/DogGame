/// @description Insert description here
// You can write your code in this editor

if (Neglect < MaxNeglect)
{
	Neglect += NeglectSpeed/60; //Increase at 1 per second	
}
else if (!instance_exists(NeglectButton))
{
	var XOffset = 100;
	NeglectButton = instance_create_layer(x+XOffset, y, "GUI", oButtonHighFive);
	NeglectButton.AllyRef = self;
	NeglectButton.XOffset = x+XOffset;
}