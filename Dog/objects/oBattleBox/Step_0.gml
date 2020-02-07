/// @description Insert description here
// You can write your code in this editor
if (keyboard_check_pressed(interact_key))
{
	
	if (page < array_length_1d(text)-1)
	{
		page ++;//event_perform(ev_other,ev_user1);
		counter = 0;
		
	}else
	{
		instance_destroy();
		instance_create_layer(0,0,"GameManager",oMiniGame);
	}
	
	
}