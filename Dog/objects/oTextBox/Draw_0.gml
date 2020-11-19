/// @description Insert description here
// You can write your code in this editor

//Exit event if there is no Text to draw for some reason
if(!variable_instance_exists(self, "CurrentText")) exit;
if(!instance_exists(TextPositionRef)) exit;

//Draw textbox
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_white, 0.8);
//draw_self();

//Set alignments for text
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(CurrentFont);

var PosX = TextPositionRef.x; //Position to draw text x
var PosY = TextPositionRef.y; //Position to draw text y
var CharWidth = string_width("M");
var CharHeight = string_height("M");
var VisibleText = ""; //Store text that is currently visible
var CurrentIndex = 0; //Store current TextExt array index
var Color = HexToDec(CurrentColor); //Store current text color
var SpecialPos = 0; //Get line position where special character was found
var TempText = CurrentText; //Get current line of text to draw

if (bDisplayOptions)
{
	for(var i=0;i<chatterbox_get_option_count(chatterbox);i++)
	{
		var Text = "";
		if (SelectedOption == i)
			Text += "* "
		Text += chatterbox_get_option(chatterbox, i);

		draw_text(PosX, PosY+(i*CharHeight), Text);
	}
}
else
{
	scribble_draw(PosX, PosY, CurrentText);
}
