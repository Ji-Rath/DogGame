///@description create_textbox
///@arg Text
///@arg FaceSprites
///@arg FaceIndexes


if(!instance_exists(oTextBox))
{
	var TextBox = instance_create_layer(0,0,"Control",oTextBox);
	TextBox.Text = argument[0];
	TextBox.Face = argument[1];
	TextBox.FaceIndex = argument[2];
}