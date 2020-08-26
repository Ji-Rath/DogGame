/// @description Insert description here


var CurrentText = TextArray[Page];
var Face = CurrentText[1];
var Text = CurrentText[0];
var FaceIndex = CurrentText[2];

//draw box
draw_sprite_ext(sTextBox,0,BoxX,BoxY, 0.5, 0.5, 0, c_white, 1);

//draw portrait back
draw_sprite(sPortraitFrame,0,FaceX,FaceY);

//draw portrait
draw_sprite(Face,FaceIndex,FaceX,FaceY);

//Text appear effect
var TextWrapped = scrStringWrap(Text,TextMaxWidth);
var StringLength = string_length(TextWrapped);
if (TextPos<StringLength)
{
	TextPos++;
}

//Draw text
var substr = string_copy(TextWrapped,1,TextPos);
draw_set_color(c_black);
draw_set_font(fnt_dialogue);
draw_text(TextX,TextY,substr);



