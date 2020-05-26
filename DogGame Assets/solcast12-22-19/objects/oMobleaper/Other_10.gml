/// regular state

 //Player input

bind_right = vk_right;
bind_left = vk_left;
bind_down = vk_down;
bind_jump = vk_space;
 
key_left = keyboard_check(bind_left);
key_right = keyboard_check(bind_right);
key_jump = keyboard_check_pressed(bind_jump);
key_down = keyboard_check(bind_down);
key_downreleased = keyboard_check_released(bind_down);
key_leftreleased = keyboard_check_released(bind_left);
key_rightreleased = keyboard_check_released(bind_right);

reset = keyboard_check(vk_alt);

if (reset)
{
	game_restart();
}
 