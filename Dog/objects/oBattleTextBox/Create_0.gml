/// @description Insert description here
// You can write your code in this editor

box = sTextBox;


box_width = sprite_get_width(box);
box_height = sprite_get_width(box);

gui_width = display_get_gui_width()
gui_height = display_get_gui_height()
global.game_width = gui_width
global.game_height = gui_height
display_set_gui_size(global.game_width,global.game_height);
EndTurn = true;



Counter = 0;
Text = [""];
TextQueue = ds_queue_create();
Page = 0;


text_col = c_black;


text_x = 140
text_y = 60


font = fnt_battle;
draw_set_font(font)
x_buffer = 50;
text_max_width = box_width - (2*x_buffer);
text_height = string_height("A");

