/// @description Insert description here
// You can write your code in this editor
if (game.pearlmet = false)
{
	if (state == 1)
	{
		
		sprite_index = idlesprite;
		movement_collision();
	
	
	
		vsp += grv;
	
		if (instance_exists(oPlayer))
		{
		
			x = oPlayer.x;
			if (oPlayer.state = states.stuck)
			{
				state = 2
			
			}
		
		}
		/*
		var playerdir = sign (oPlayer.x-x);
		move = playerdir;
	
		hsp += move*walksp;
		hsp*= movefriction;
		*/
	
		count = 0;
	
	}
	if (state = 2)
	{
	
		
		
		movement_collision();
		vsp += grv;
		count += 1;
		if (count < 2)
		{
			sprite_index = knockbacksprite;
			image_index = 0;
		}
		else if (count < (2*knockbackframes)-1)
		{
			sprite_index = knockbacksprite;
			
		}
		else
		{
			sprite_index = knockbackloopsprite;
		}

	
	
		hsp*= movefriction;
	
	
		if (count = 1)
		{
			vsp = -20;
			hsp = -20;
		
		}
	
	
		if (place_meeting(x,y+vsp,oWall)) 
		{
			game.pearlmet = true;
			state = 1;
			count = 0;
		}
	
	}
}
else
{
	
	if (state = 1)
	{
		count += 1;
		
		if (count < 2)
		{
			sprite_index = knockbacklandsprite;
			image_index = 0;
			
		}
		else if (count < (2*landframes)-1)
		{
			sprite_index = knockbacklandsprite;
			
		}
		else
		{
			sprite_index = knockbacklandsprite;
			image_index = landframes-1;
			
		}
		
		
		
		if (count > (2*landframes))
		{
				state = 2;
				count = 0;
		}
		
	
		
		movement_collision();
		vsp += grv;
		hsp *= movefriction;	
		
	}
	else if (state = 2)
	{
		count += 1;
		
		if (count < 2)
		{
			sprite_index = getupsprite;
			image_index = 0;
			
		}
		else if (count < (2*getupframes)-1)
		{
			sprite_index = getupsprite;
			
			
		}
		else
		{
			sprite_index = idlesprite;
		}
		
		
		
		if (oPlayer.state == states.Playernormal)
		{
			instance_create_layer(x,y,"parryspark",oDialogue1);
			
		}
		
		
		
		movement_collision();
		vsp += grv;
		hsp *= movefriction;
		
	}
	
	
}