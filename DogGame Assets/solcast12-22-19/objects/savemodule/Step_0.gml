/// @description Insert description here
// You can write your code in this editor

sprite_index = checkpointasset;

if (state = checkpointstates.off)
{
	count = 0;
	instance_destroy(mysave);
	
	image_index = 0;
}
else if (state = checkpointstates.save)
{
	
	
	
}
else if (state = checkpointstates.on)
{
	image_index = 1;
	
	count += 1;
	
	if (count < 10)
	{
		if (mysave = noone)
		{
			mysave = instance_create_layer(oPlayer.x,oPlayer.y,"parryspark",checkpoint);
		}
	
	
	
	}
	else
	{
		instance_destroy(mysave);
		
		
	}
	
	

	if (mylight = noone)
	{
		
		mylight = instance_create_layer(x,y,"parryspark",lightasset)	
		
	}
	
	if (game.lastcheckpoint != id)
	{
		
		instance_destroy(mylight);
		state = checkpointstates.off
		mylight = noone;
		mysave = noone;
		count = 0
		
		
	}
	
}