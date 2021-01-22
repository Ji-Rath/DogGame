/// @description Insert description here
// You can write your code in this editor

if (Neglect < MaxNeglect)
{
	Neglect += NeglectSpeed/60; //Increase at 1 per second	
}
else if (!instance_exists(NeglectButton))
{
	NeglectButton = instance_create_layer(x, y, "GUI", oButtonHighFive);
	NeglectButton.AllyRef = self;
}