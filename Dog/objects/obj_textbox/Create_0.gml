/// @description Insert description here
// You can write your code in this editor

box = spr_dialoguebox;
frame = spr_portraitframe;
portrait = sDogpaddlerface;
box_width = sprite_get_width(box);
box_height = sprite_get_width(box);
port_width = sprite_get_width(portrait);
port_height = sprite_get_width(portrait);
gui_width = display_get_gui_width()
gui_height = display_get_gui_height()
global.game_width = gui_width
global.game_height = gui_height
display_set_gui_size(global.game_width,global.game_height);


port_x = (global.game_width - box_width - port_width)*0.5;
port_y = (global.game_height*0.98)-port_height;
box_x = port_x + port_width;
box_y = port_y;
portrait_index = 1;

counter = 0;
text[0] = ""
page = 0;
interact_key = oDogPaddler.bind_action;


text_col = c_black;

x_buffer = 30;
y_buffer = 30;
text_x = box_x +  x_buffer;
text_y = box_y +  y_buffer;


font = fnt_dialogue;
draw_set_font(font)

text_max_width = box_width - (2*x_buffer);
text_height = string_height("A");

