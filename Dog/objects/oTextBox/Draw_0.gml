/// @desc Draw textbox and text

//Exit event if there is no Text to draw for some reason
if(!variable_instance_exists(self, "CurrentText")) exit;
if(!instance_exists(TextPositionRef)) exit;

//Draw textbox
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_white, 0.8);

var PosX = TextPositionRef.x; // Position to draw text x
var PosY = TextPositionRef.y; // Position to draw text y

if (bDisplayOptions)
{
	// Draw available options
	var NewLine = "";
	for(var i=0;i<chatterbox_get_option_count(chatterbox);i++)
	{
		var Text = "";
		if (SelectedOption == i)
			Text += "* "
		Text += chatterbox_get_option(chatterbox, i);

		scribble_draw(PosX, PosY, (NewLine)+Text);
		NewLine += "#"
	}
}
else
{
	// Draw line of text
	scribble_draw(PosX, PosY, CurrentText);
}
