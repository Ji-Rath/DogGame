/// @description Insert description here
// You can write your code in this editor

//Draw box
draw_sprite(box,0,0,0);

//Text appear effect
var text_wrapped = scrStringWrap(text[page],text_max_width);
var str_len = string_length(text_wrapped);
if (counter<str_len)
{
	counter++;
}
var substr = string_copy(text_wrapped,1,counter);


//Draw text
var c = text_col
draw_text_color(text_x,text_y,substr,c,c,c,c,1)
draw_text_color(text_x+1,text_y,substr,c,c,c,c,1)

//draw_text_color(text_x+1,text_y+1,substr,c,c,c,c,1)
//draw_text_color(text_x,text_y+1,substr,c,c,c,c,1)
/*
draw_text_ext_color(text_x+1,text_y,text,text_height,text_max_width,c,c,c,c,1)
draw_text_ext_color(text_x+1,text_y+1,text,text_height,text_max_width,c,c,c,c,1)
draw_text_ext_color(text_x,text_y+1,text,text_height,text_max_width,c,c,c,c,1)
*/