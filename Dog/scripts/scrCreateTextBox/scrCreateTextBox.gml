///@description scrCreateTextBox(TextArray)
///@arg TextArray


if(!instance_exists(oTextBox))
{
	var TextBox = instance_create_layer(0,0,"Control",oTextBox);
	TextBox.TextArray = argument0;
}