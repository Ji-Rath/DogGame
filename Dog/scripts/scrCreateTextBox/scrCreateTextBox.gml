///@description create_textbox
///@arg text
///@arg speakers


if(!instance_exists(oTextBox))
{
	var TextBox = instance_create_layer(0,0,"text",oTextBox);
	var Text = argument[0];
	var Speaker = argument[1];
	
	TextBox.Text = Text;
	TextBox.Face = Speaker.Face;
	TextBox.Speaker = Speaker;
	TextBox.FaceIndex = Speaker.FaceIndex;
}