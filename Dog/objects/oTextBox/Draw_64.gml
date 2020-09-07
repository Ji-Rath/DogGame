/// @description Insert description here
// You can write your code in this editor

//Draw textbox if not about to be destroyed
if(Timer[0] == -1)
{
	var CurrentText = TextArray[Page];
	var Face = CurrentText[1];
	var Text = CurrentText[0];
	var FaceIndex = CurrentText[2];
	
	//draw box
	draw_sprite(sDialogueBox,0,BoxX,BoxY);
	
	
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
}

//draw_text_color(text_x+1,text_y+1,substr,c,c,c,c,1)
//draw_text_color(text_x,text_y+1,substr,c,c,c,c,1)
/*
draw_text_ext_color(text_x+1,text_y,text,text_height,text_max_width,c,c,c,c,1)
draw_text_ext_color(text_x+1,text_y+1,text,text_height,text_max_width,c,c,c,c,1)
draw_text_ext_color(text_x,text_y+1,text,text_height,text_max_width,c,c,c,c,1)