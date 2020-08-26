/// @description Insert description here
// You can write your code in this editor

if(mouse_check_button_pressed(mb_left) && point_in_rectangle(mouse_x, mouse_y, bbox_left, bbox_top, bbox_left+string_width(ButtonText), bbox_top+string_height(ButtonText)))
{
	event_perform(ev_mouse, ev_left_press);
}