/// @description Insert description here
// You can write your code in this editor

gamepadbuffer = 0;



gui_width = display_get_gui_width();
gui_height = display_get_gui_height();
gui_margin = 200;
menuleave = 500;
menu_x = gui_width+menuleave;
menu_y = gui_height - gui_margin;
menu_x_target = gui_width - gui_margin;
menu_speed = 25;//lower is faster
menu_font = fMenu;
menu_itemheight = font_get_size(fMenu);
menu_committed = -1;
menu_control = true;

transitioncount = 0;


menu[2] = "New Game";
menu[1] = "Continue";
menu[0] = "Quit";

menu_items = array_length_1d(menu);
menu_cursor = 2;