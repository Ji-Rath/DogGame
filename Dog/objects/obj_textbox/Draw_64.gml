/// @description Insert description here
// You can write your code in this editor
//box
draw_sprite(box,0,box_x,box_y);


//draw portrait back
draw_sprite(frame,0,port_x,port_y);



//draw portrait
draw_sprite(portrait,portrait_index,port_x,port_y);




//drawtext
if (counter<str_len)
{
	counter++;
}


var substr = string_copy(text_wrapped,1,counter);


var c = text_col
draw_text_color(text_x,text_y,substr,c,c,c,c,1)
draw_text_color(text_x+1,text_y,substr,c,c,c,c,1)
//draw_text_color(text_x+1,text_y+1,substr,c,c,c,c,1)
//draw_text_color(text_x,text_y+1,substr,c,c,c,c,1)
/*
draw_text_ext_color(text_x+1,text_y,text,text_height,text_max_width,c,c,c,c,1)
draw_text_ext_color(text_x+1,text_y+1,text,text_height,text_max_width,c,c,c,c,1)
draw_text_ext_color(text_x,text_y+1,text,text_height,text_max_width,c,c,c,c,1)