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

for(var i=1;i<=CurrentChar;i++) //Start at 1 since string functions index starts at 1
{
	var X = 0;
	var Y = 0;
	VisibleText = string_copy(TempText, 1, i); //Get 1 character ahead of currently drawn text
	SpecialPos = string_pos("%", VisibleText); //Try to get position of % character
	while(SpecialPos != 0 && array_length(CurrentTextExt) > CurrentIndex)
	{
		var NextChar = string_char_at(TempText, SpecialPos+1); //Get character after %
		
		//Execute special commands based on character after %
		var CurrentVal = CurrentTextExt[CurrentIndex];
		switch(NextChar)
		{
			case "c":
				if(is_real(CurrentVal))
					Color = CurrentVal;
				if(is_string(CurrentVal))
					Color = HexToDec(CurrentVal);
				break;
			case "f":
				if(is_real(CurrentVal))
					CharSpeed = CurrentVal;
				break;
		}
			
		//Go to next TextExt array index
		CurrentIndex++;
		
		TempText = string_delete(TempText, SpecialPos, 2);
		
		//Recheck if there is a % character
		VisibleText = string_copy(TempText, 1, i); //Get 1 character ahead of currently drawn text
		SpecialPos = string_pos("%", VisibleText); //Try to get position of % character
	}
	
	X = (((i-1)%NewLineCutOff)*CharWidth); //Increase x position to get ready for next character
	Y = (floor((i-1)/NewLineCutOff))*CharHeight //Increase y position when there is a new line
	
	var DrawChar = string_char_at(TempText, i); //Get current character
	draw_text_color(PosX + X, PosY + Y, DrawChar, Color, Color, Color, Color, 1); //Draw character
}

DrawnText = TempText;