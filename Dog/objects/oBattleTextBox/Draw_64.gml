/// @description Insert description here
// You can write your code in this editor

//Set font/color
draw_set_color(c_black);
draw_set_font(fnt_battle);

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
draw_text(text_x,text_y,substr)
