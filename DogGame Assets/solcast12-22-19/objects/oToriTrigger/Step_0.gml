/// @description Insert description here
// You can write your code in this editor

if (instance_exists(oPlayer))
{
	
	
	
	
	
	
	if (oPlayer.state != states.stuckgetup)
	{
	if (oPlayer.state != states.Playeremptynormal)
	{
		
		

		if (state == 1)
		{
			sprite_index = sToriGround;
			tori = noone;
			count = 0;
			movement_collision();
			vsp += grv;
	
			var playerdist = point_distance(x,y,oPlayer.x,oPlayer.y)
		
			if (playerdist < 100)
			{
				with (oPlayer)
				{
						
					if (key_action)
					{
						state = states.toripull;
						other.state = 2;
						//other.jackpot = choose(0,1,0,0)
					
					
					}
				
				
				}
			}
				
			

		}
		else if (state == 2)
		{
	
				movement_collision();
				vsp += grv;
				oPlayer.x = x;
				oPlayer.y = y;
				count ++;
				if (oPlayer.state = states.PlayerKnockback)
				{
					state = 3;
					
				}
				if (count < 2)
				{
					sprite_index = sToriPull;
					image_index = 0;
		
		
				}
				else if (count < ((2*21)-1))
				{
					sprite_index = sToriPull;
		
				}
				else
				{
					state = 3;
					oPlayer.state = states.Playernormal;
					/*
					if (jackpot = 1)
					{
						instance_create_layer(x,y-200,"parryspark",oPoint)
						instance_create_layer(x,y-200,"parryspark",oPoint)
						instance_create_layer(x,y-200,"parryspark",oPoint)
						instance_create_layer(x,y-200,"parryspark",oPoint)
					}*/
					
				}
	
		}
		else if (state == 3)
		{
	
				sprite_index = sBlank;

		
				if (tori == noone)
				{
					tori = instance_create_layer(x,y-200,"mob",oTori);
					tori.kbstrength = 0;
					tori.kustrength = 30;
					tori.mobstate = mobstates.mobknockback;
		
		
				}
				if (instance_exists(tori))
				{
					var playerdist = point_distance(x,y,oPlayer.x,oPlayer.y)
					var playerdist2 = point_distance(tori.x,tori.y,oPlayer.x,oPlayer.y)
	
	
					if (playerdist > 1000) and (playerdist2 > 1000)
					{
						state = 1;
						instance_destroy(tori);
		
					}

				}


	
	
	
		}
	}
	else
	{
		movement_collision();
		vsp += grv;
		
	}
	}

}
