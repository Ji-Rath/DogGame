if (loops < moves) && (timer = 0)
{
	ds_queue_enqueue(queue,(choose(dance.UP,dance.DOWN,dance.LEFT,dance.RIGHT)));
	switch(ds_queue_tail(queue))
{
	case dance.UP: 
		image_xscale = 1;
		image_index = 3;
		image_speed = 1;
		oSSInputArrow.image_index = 1;
	break;
	case dance.DOWN: 
		image_xscale = 1;
		image_index = 7
		image_speed = 1;
		oSSInputArrow.image_index = 2;
	break;
	case dance.LEFT:
		image_xscale = -1;
		oSSInputArrow.image_xscale = -1;
		oSSInputArrow.image_index = 0;
		image_index = 0
		image_speed = 1;
	break;
	case dance.RIGHT:
		image_xscale = 1;
		image_index = 0
		image_speed = 1;
		oSSInputArrow.image_index = 0;


}
	timer = 30;
	loops++;
}
else if (loops >= moves) && (moves > 0) && (!finish)
{
	switch(keyboard_lastkey)
		{
	case vk_up: playerinput = dance.UP; 
		moves--;
		image_index = 0;
				oSSDogPaddler.image_xscale = 1;
		oSSDogPaddler.image_index = 3;
		oSSDogPaddler.image_speed = 1;
		oSSInputArrow.image_index = 3;
	break;
	case vk_down: playerinput = dance.DOWN;  
		moves--; 
		image_index = 0;
				oSSDogPaddler.image_xscale = 1;
	oSSDogPaddler.	image_index = 7
	oSSDogPaddler.	image_speed = 1;
	oSSInputArrow.image_index = 3;
	break;
	case vk_left: playerinput = dance.LEFT;  
		moves--; 
		image_index = 0;
				oSSDogPaddler.image_xscale = -1;
	oSSDogPaddler.	image_index = 0
	oSSDogPaddler.	image_speed = 1;
	oSSInputArrow.image_index = 3;
	break;
	case vk_right: playerinput = dance.RIGHT; 
		moves--; 
		image_index = 0;
			oSSDogPaddler.image_xscale = 1;
	oSSDogPaddler.image_index = 0
	oSSDogPaddler.image_speed = 1;
	oSSInputArrow.image_index = 3;
	break;
	default: playerinput = dance.NONE;
	
	break;
		}

	keyboard_lastkey = -1;


if (playerinput != dance.NONE && playerinput != ds_queue_dequeue(queue))
	{
		ds_queue_destroy(queue);
		finish = true;
		scrFinishMiniGame(false);
	
	}
	else if (ds_queue_empty(queue))
	{
		ds_queue_destroy(queue);
		finish = true;
		scrFinishMiniGame(true);
	}
}

if (image_index == 6 || image_index == 10 || image_index == 2)
	{
		image_speed = 0;
	}
	
	
timer--;