/// @description Insert description here
// You can write your code in this editor
/*
var playerface = sign (oPlayer.x - x);
if (playerface != 0)
{
	image_xscale = playerface;
	
}
*/
/*
particlecount += 1;
var r = particlecount mod 1;
if (r = 0)
{
	instance_create_layer(x,y+random(10),"mob",oShiniparticle);
	instance_create_layer(x,(y+random(10))-10,"mob",oShiniparticle);
	instance_create_layer(x,(y+random(10))+10,"mob",oShiniparticle);
	
	
}
if (instance_exists(oWall))
{
	if (place_meeting(x,y,oWall))
	{
		instance_destroy();
		instance_destroy(myparticle);
		instance_create_layer(x,y,"parryspark",oShinismoke);
			
	}
		
}
	
	*/


var dir1 = oPlayer.x - x;
if (myparticle = noone)
{
	myparticle = instance_create_layer(x,y,"parryspark",particlesystem);
	myparticle.parent = id;
}

	
if (instance_exists(starbarrier))
{
	if (place_meeting(x,y,starbarrier))
	{
			instance_destroy();
		instance_destroy(myparticle);
		instance_create_layer(x,y,"parryspark",oShinismoke);
		
	}
	
}
if (instance_exists(oWall))
{
	if (place_meeting(x,y,oWall))
	{
		instance_destroy();
		instance_destroy(myparticle);
		instance_create_layer(x,y,"parryspark",oShinismoke);
			
	}
		
}
	
if (instance_exists(oHeal))
{
	instheal = instance_nearest(x,y,oHeal);
	var playerface = point_direction(x,y,instheal.x,instheal.y);
	if (sign(instheal.x - x) = -1)
	{
		image_yscale = -1;
		
	}
	else
	{
		image_yscale = 1;
		
	}
	
	image_angle = playerface;
	if (!place_meeting(x,y,oHeal))
	{
		moveprime = 1;

	}
	else
	{
		moveprime = 0;
		
		
	}

}
else
{
	instheal = oPlayer;
	var playerface = point_direction(x,y,instheal.x,instheal.y);
	image_angle = playerface;
	if (sign(instheal.x - x) = -1)
	{
		image_yscale = -1;
		
	}
	else
	{
		image_yscale = 1;
		
	}
	
	
	var activerange = 110;
	var dist2player = point_distance(x,y,oPlayer.x,oPlayer.y);
	
	

	
	if (place_meeting(x,y,oPlayer))
	{
		instance_destroy();
		instance_destroy(myparticle);
		instance_create_layer(x,y,"parryspark",oShinismoke);
		
		
		moveprime = 1;
		
		
		with (follow)
		{
			
			
			
			if (game.juststarted == true) and (oPlayer.state != states.chest)
			{
				
				state = states.Playerknockbackempty;
				
				image_xscale = -scale*(sign(dir1));
				kbhsp = (sign(other.hsp)*knockbackstrength)
				
				
				
			}
			else if (oPlayer.state != states.chest)
			{
				image_xscale = -scale*(sign(dir1));
				state = states.PlayerKnockback;
				if (state = states.PlayerGlide)
				{
					oYam.macrostate1 = party1macrostates.followplayer;
					oYam.state = party1states.reposition;
					
					dog.state = follow2;
					
					
				}
				
				kbhsp = (sign(other.hsp)*knockbackstrength)
				
				
				
			}
			
			
		}
		
		
		
	}
	else
	{
		if (dist2player < activerange)
		{
		
			moveprime = 0;
		
		}
		else
		{
			moveprime = 1;
		
		}
		
	}
	
	
	
	
	
}



	var dir2 = point_direction(x,y,instheal.x,instheal.y)
	var speed2heal = 1.5;
	
	hsp += lengthdir_x(speed2heal,dir2)*moveprime*walksp;
	vsp += lengthdir_y(speed2heal,dir2)*moveprime*walksp;
	
	hsp *= 0.9;
	vsp *= 0.9;



	y += vsp;
	x += hsp;
		

	y += vspcollide;
	x += hspcollide;
		
		
		
		

		