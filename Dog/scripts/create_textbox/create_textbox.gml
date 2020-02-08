///@description create_textbox
///@arg text
///@arg speakers


if(!instance_exists(obj_textbox))
{
	var TextBox = instance_create_layer(0,0,"text",obj_textbox);
	var Text = argument[0];
	var Speaker = argument[1];
	
	TextBox.Text = Text;
	TextBox.Face = Speaker.Face;
	TextBox.Speaker = Speaker;
	TextBox.FaceIndex = Speaker.FaceIndex;
}