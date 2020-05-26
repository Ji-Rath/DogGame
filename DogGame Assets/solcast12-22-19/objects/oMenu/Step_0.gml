/// @description Insert description here
// You can write your code in this editor
menu_x += (menu_x_target - menu_x)/menu_speed;


if (menu_control)
{
	if (keyboard_check_pressed(vk_up))
	{
		menu_cursor++;
		if(menu_cursor>=menu_items) menu_cursor = 0;
		
	}
	if (keyboard_check_pressed(vk_down))
	{
		menu_cursor--;
		if(menu_cursor<0) menu_cursor = menu_items - 1;
		
	}
	
	if (keyboard_check_pressed(vk_enter))
	{
		menu_x_target = gui_width+(1.5*menuleave);
		menu_committed = menu_cursor;
		menu_control = false;
		
		
	}
	
	if (gamepad_button_check_pressed(0,gp_start))
	{
		menu_x_target = gui_width+(1.5*menuleave);
		menu_committed = menu_cursor;
		menu_control = false;
	}
	
	if (abs(gamepad_axis_value(0,gp_axislv)) > 0.2)
	{
		if (sign(gamepad_axis_value(0,gp_axislv)) == -1)
		{
			gamepadbuffer ++
			if (gamepadbuffer == 1)
			{
				menu_cursor ++
				if(menu_cursor>=menu_items) menu_cursor = 0;
			}
			else if (gamepadbuffer > 60) and (gamepadbuffer mod 15 == 0)
			{
				menu_cursor ++
				if(menu_cursor>=menu_items) menu_cursor = 0;
			}
			
		}
		if (sign(gamepad_axis_value(0,gp_axislv)) == 1)
		{
			gamepadbuffer ++
			if (gamepadbuffer == 1)
			{
				menu_cursor --
				if(menu_cursor<0) menu_cursor = menu_items - 1;
			}
			else if (gamepadbuffer > 60) and (gamepadbuffer mod 15 == 0)
			{
				menu_cursor --
				if(menu_cursor<0) menu_cursor = menu_items - 1;
			}
			
		}
	}
	
}

if (menu_committed = 0)
{
	game_end();
	
	
}
else if (menu_committed = 1)
{
	
	
		var transecs = 0.5;
	transitioncount ++;
	if (transitioncount > (60*transecs))
	{
		
		room_goto(rm_alpha2);
		
	}
	
	
	
	
	
	
	
}
else if (menu_committed = 2)
{
	var transecs = 0.5;
	transitioncount ++;
	if (transitioncount > (60*transecs))
	{
		
		room_goto_next();
		
	}
	
	
}