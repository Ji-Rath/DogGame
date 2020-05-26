/// @description Insert description here
// You can write your code in this editor
if (treasuredetect != 2)
{
	barkanimcount = 0;
	
}

if (sprite_index != sDogbark)
{
	barkcount = 0;
	
}

if (sprite_index = sDogbark)
{
	barkcount += 1
	

	if (barkcount < 2)
	{
		audio_play_sound(barksfx,501,false);
		audio_sound_pitch(barksfx,random_range(0.9,1.1))
								
	}

	
	if (barkcount > (2*image_number)-1)
	{
		sprite_index = sDogpant;
		
	}
	

	
}

					
					
if (place_meeting(x,y+3,oWall))
{
	var instwall = instance_place(x,y+3,oWall)
	var instwall2 = instance_place(x-(sign(image_xscale)*10),y+3,oWall)
	
	if (instwall != noone) and (instwall = instwall2)
	{
		image_angle = instwall.image_angle;
		
		
	}
	/*
	with (oWall)
	{
		other.image_angle = image_angle
		
		
	}
	*/
	
}
else
{
	image_angle = 0;
	
}



parryspark = oParryspark;
onewaystarting();


if (instance_exists(oPlayer))
{
	
	if (oPlayer.iframestate = iframes.active)
	{
		
			
		if (image_alpha = 1)
		{
			image_alpha = 0;
		
		}
		else
		{
			image_alpha = 1;
		
		
		}
		
		
	}
	else
	{
		
		image_alpha = 1;
		
		
	}
	
	
}





if (state == dogstates.sleep)
{
	#region sleep
	vsp += grv;
	movement_collision()
	
	
	
	if (place_meeting(x,y,oPlayer))
	{
		PlayerTouch = true;
	}
	else{
		PlayerTouch = false;
		
	}
	
	
	if (PlayerTouch == true)
	{
		state = dogstates.follow2;
		
	}
	
	
	
	#endregion
		
}
else if (state == dogstates.dogrolling)
{
	#region rolling
	dogrollcount += 1;
	
	dhsp -= 1;
	
	x = x + dhsp;
	
	
	if (dhsp < 1)
	{
		state = dogstates.sleep;
		
	}
	
	
	
	#endregion
}
else if (state == dogstates.resetpos)
{
	#region
	
	x = follow.x;
	y = follow.y - 40;
	
	state = dogstates.follow2;
	
	

	
	#endregion
	
}
else if (state == dogstates.sliding)
{
	#region
	
	
	ds_queue_enqueue(Followque2,follow.x);
	ds_queue_enqueue(Followque2,follow.y);
	ds_queue_enqueue(Followque2,follow.image_xscale);
	
	if (ds_queue_size(Followque2)>10)
	{
		x = ds_queue_dequeue(Followque2);
		y = ds_queue_dequeue(Followque2);
		image_xscale = ds_queue_dequeue(Followque2);
		
	}
	
	
	
	
	if (place_meeting(x,y,mSlopereset))
	{
		state = dogstates.follow;
		
		
	}
	#endregion
	
}
else if (state == dogstates.follow2)//
{
	hsp = 40;
	vsp = -40;
	
	#region
	
	
	movement_collision()
	///follow code
	
	


	if (instance_exists(oParryspark))
	{
		parrysparkexists = 1;
		
	}
	else
	{
		parrysparkexists = 0;
		
	}
	
	
	
	ds_queue_enqueue(Followque2,oPlayer.hsp);
	ds_queue_enqueue(Followque2,oPlayer.vsp);
	ds_queue_enqueue(Followque2,oPlayer.image_xscale);
	ds_queue_enqueue(Followque2,oPlayer.collision);
	ds_queue_enqueue(Followque2,oPlayer.idleanim);

	
	ds_queue_enqueue(Followque2,oPlayer.rollanim);
	ds_queue_enqueue(Followque2,oPlayer.njumpanim);
	
	ds_queue_enqueue(Followque2,oPlayer.runanim);
	ds_queue_enqueue(Followque2,oPlayer.startupanim);
	ds_queue_enqueue(Followque2,oPlayer.winddownanim);
	
	ds_queue_enqueue(Followque2,oPlayer.landanim);
	
	ds_queue_enqueue(Followque2,oPlayer.fjumpstartanim);
	
	ds_queue_enqueue(Followque2,oPlayer.x);
	ds_queue_enqueue(Followque2,oPlayer.y);
	ds_queue_enqueue(Followque2,oPlayer.state);
	ds_queue_enqueue(Followque2,oPlayer.slopedir);

	ds_queue_enqueue(Followque2,parrysparkexists)
	ds_queue_enqueue(Followque2,follow.state)


	

	
	
	if ((ds_queue_size(Followque2)) > lagbehind)
	{
	    followingx = ds_queue_dequeue(Followque2);
	    followingy = ds_queue_dequeue(Followque2);
		image_xscale = sign(ds_queue_dequeue(Followque2))*dogscale;
		DogGrounded = ds_queue_dequeue(Followque2);
		DogIdleAnim = ds_queue_dequeue(Followque2);
		
		DogRolling = ds_queue_dequeue(Followque2);
		nothing = ds_queue_dequeue(Followque2);
		
		DogRunanim = ds_queue_dequeue(Followque2);
		DogStartup = ds_queue_dequeue(Followque2);
		DogWinddown = ds_queue_dequeue(Followque2);
		
		DogLand = ds_queue_dequeue(Followque2);
		
		DogFjumpanim = ds_queue_dequeue(Followque2);
		
		queuex = ds_queue_dequeue(Followque2);
		queuey = ds_queue_dequeue(Followque2);
		
		followstate = ds_queue_dequeue(Followque2);
		slopedir = ds_queue_dequeue(Followque2);
		parryqueue = ds_queue_dequeue(Followque2);
		
		followstate = ds_queue_dequeue(Followque2);

		
	}


	x = queuex;
	y = queuey;


	if (followstate = states.PlayerKnockback)
	{
		doghurtanim = 1;
		
		
	}
	else
	{
		doghurtanim = 0;
		doghurtcount = 0;
		
	}


	if (follow.state = states.Playerparry) and (follow.collision = 0)
	{
		sprite_index = sDogFall;
		image_index = 0;
		bumpoffanim = 1;
	}
	
	if (bumpoffanim == 1) 
	{
		bumpoffcount += 1;
		


		if (bumpoffcount < 2)
		{
			sprite_index = sDogFall;
			image_index = 0;
		}
		else if (bumpoffcount < 11)
		{
			
			sprite_index = sDogFall;
			
		}
		else if (bumpoffcount < 11 + 1)
		{
			sprite_index = sDogFjumpStart;
			image_index = 0;
			
		}
		else if (bumpoffcount < 11 + Fjumpframes)
		{
			sprite_index = sDogFjumpStart;
			
			
		}
		else
		{
			sprite_index = sDogFjump;
			
		}
		

		
		
	}
	
	
	
	if (follow.collision == 1)
	{
		bumpoffcount = 0;
		bumpoffanim = 0;
		
		
	}
	
	
	
if (bumpoffanim != 1)
{
		if (follow.state != states.Playerparry)
		{
			#region master anim
				if (doghurtanim != 1)
				{
				#region anims
					if (DogWinddown == 1)
					{
		
						dogrollcount = 0;
						Fjumpcount = 0;
						startupcount = 0;
						DogRunanim = 0;
						DogStartup = 0;
						DogIdleAnim = 0;
						winddowncount += 1;
		
						if (winddowncount < 2)
						{
							sprite_index = sDogWinddown;
							image_index = 0;
						}
						else if (winddowncount < winddownframes)
						{
							sprite_index = sDogWinddown;
						}
						else
						{
							if (treasuredetect = 2)
							{
								barkanimcount += 1;
								if (barkanimcount < 2)
								{
									sprite_index = sDogbark;
								}
							}
							else if (treasuredetect = 1)
							{
								sprite_index = sDogpant;
							}
							else
							{
								sprite_index = sDog;
							
							}
							
						}
		

					}

					if (DogIdleAnim == 1)
					{
		
						Fjumpcount = 0;
						DogFjumpanim = 0;
						njumpcount = 0;
						DogNJumpanim = 0;
		
						DogWinddown = 0;
						winddowncount = 0;
						DogRunanim = 0;
						DogStartup = 0;
						DogLeapCount = 0;
						
						if (treasuredetect = 2)
						{
							barkanimcount += 1;
							if (barkanimcount < 2)
							{
								sprite_index = sDogbark;
							}
							
						}
						else if (treasuredetect = 1)
						{
							sprite_index = sDogpant;
						}
						else
						{
							sprite_index = sDog;
							
						}
						
						
		
		
		
		
					}
	
	
	
	
					if (followstate = states.PlayerSlide)
					{
						DogFjumpanim = 0;
						DogRunanim = 1;
						DogRolling = 0;
		
		
					}
	
					
	
	
	
	
					/////

				/*
					if (dogwalkoff = 1)
					{
						Fjumpcount = Fjumpframes;
		
					}
	
				*/
					///////////////////////////////////////////////////////////////////////
				
				
				
				
				
				
					#region jumping anims
					if (DogFjumpbuffer = 1)
					{
						DogFjumpanim = 1;
		
					}

	
					if (DogFjumpanim == 1) and (DogRolling != 1) and (DogRunanim != 1)
					{
						dogrollcount = 0;
						njumpfall = 1;
		
						Fjumpcount += 1;
						if (Fjumpcount < 2)
						{
			
							sprite_index = sDogFjumpStart;
							image_index = 0;
			
			
						}
						else if (Fjumpcount < Fjumpframes)
						{
							sprite_index = sDogFjumpStart;
						}
						else
						{
		
							sprite_index = sDogFjump;
		
						}
		
		
		
					}
					
					
					
	
					if (nothing == 0)
					{
						njumpcount = 0;
						
					}
	
	
	
					// leaping

	
					if (nothing == 1) and (njumpfall = 0)
					{
						dogrollcount = 0;
						njumpcount += 1;
		
						if (njumpcount < 2) and (DogLand == 0)
						{
							sprite_index = sDogNjump;
							image_index = 0;
						}
						else if (njumpcount < njumpframes)
						{
							sprite_index = sDogNjump;
						}
						else if (njumpcount == njumpframes)
						{
							sprite_index = sDogFall;
							image_index = 0;
						}
						else if (njumpcount < njumpframes + fallframes)
						{
							sprite_index = sDogFall;
						}
						else if (njumpcount < njumpframes + fallframes + 1 )
						{
							sprite_index = sDogFjumpStart;
							image_index = 0;
			
						}
						else if (njumpcount < njumpframes + fallframes + Fjumpframes)
						{
							sprite_index = sDogFjumpStart;
			
						}
						else
						{
							sprite_index = sDogFjump;
			
						}
		
		

		
		
		
				
		

		
					}
					else if (njumpfall == 1) and (nothing == 1)
					{
						dogrollcount = 0;
						Fjumpcount = 0;
						njumpcount += 1;
						if (njumpcount < 2)
						{
							sprite_index = sDogFallfrom;
							image_index = 0;
						}
						else if (njumpcount < 2*(11))
						{
			
							sprite_index = sDogFallfrom;
			
						}
						else if (njumpcount < (2*11) + 1)
						{
							sprite_index = sDogFjumpStart;
							image_index = 9;
			
						}
						else if (njumpcount < (2*11) + Fjumpframes - 9)
						{
							sprite_index = sDogFjumpStart;
			
			
						}
						else
						{
							sprite_index = sDogFjump;
			
						}
		
					}
	
	
	
	
	
					if (DogLand == 1) and (DogRolling != 1) and (parryqueue == 0)
					{
						njumpfall = 0;
						Fjumpcount = 0;
						DogFjumpanim = 0;
						njumpcount = 0;
						DogNJumpanim = 0;
						landingcount += 1;
		
						if (landingcount < 2) 
						{
							sprite_index = sDogLand;
							image_index = 0;
						}
						else if (landingcount < doglandingframes)
						{
							sprite_index = sDogLand;
						}
						else
						{
							if (treasuredetect = 2)
							{
								barkanimcount += 1;
								if (barkanimcount < 2)
								{
									sprite_index = sDogbark;
								}

							
							}
							else if (treasuredetect = 1)
							{
								sprite_index = sDogpant;
							}
							else
							{
								sprite_index = sDog;
							
							}
							
						}
		
					}
					else
					{
						landingcount = 0;
					}
	
		
					if (DogRunanim == 1) and (DogFjumpanim != 1) and (DogRolling != 1)
					{
						DogFjumpanim = 0;
						njumpfall = 0;
						Fjumpcount = 0;
						dogrollcount = 0;
						sprite_index = sDogRun;
		
					}
	
					if (DogStartup == 1) and (DogFjumpanim != 1)
					{
						Fjumpcount = 0;
						DogFjumpanim = 0;
						winddowncount = 0;
		
						startupcount += 1;
						if (startupcount < 2)
						{
							sprite_index = sDogStartup;
							image_index = 0;
						}
						else if (startupcount < startupframes)
						{
							sprite_index = sDogStartup;
						}
					}
	
	



	
	
					if (DogRolling == 1) 
					{
						njumpfall = 0;
						DogNJumpanim = 0;
						DogFjumpanim = 0;
						Fjumpcount = 0;
						njumpcount = 0;
						winddowncount = 0;
						//play dogrollanim
						
						
						
						dogrollcount += 1;
		
						if (dogrollcount < 2)
						{
							sprite_index = sDogRoll;
							image_index = 0;
						}
						else if (dogrollcount < dogrollframes)
						{
							sprite_index = sDogRoll;
						}
					}
					
					
					
					
					
		//////////////////////////////////////////////////////////
					#endregion
	
	
	
	
	
					#endregion
	
	
				}
	
				if (doghurtanim == 1)
				{
					doghurtcount += 1;
		
		
					if (doghurtcount < 3)
					{
			
						sprite_index = sDogHurt;
			
					}
					else if (doghurtcount < 3+1)
					{
						sprite_index = sDogNjump;
						image_index = 0;
			
					}
					else if (doghurtcount < 3 + njumpframes)
					{
						sprite_index = sDogNjump;
			
					}
					else
					{
						sprite_index = sDogFall;
			
					}
		
		
		
				}
		
			#endregion
	
		}	
	
}
	
	
	#endregion
	
}
else if (state == dogstates.blank)
{
	sprite_index = sBlank;
	ds_queue_clear(Following_que);
	
	ds_queue_clear(Followque2);
	x = follow.x;
	y = follow.y;
	
}
else if (state == dogstates.throw)
{/*
	movement_collision();
	hsp *= 0.8;
	vsp += grv;
	grv = player.grv;
	throwstartcount += 1;
	if (throwstartcount >5)
		{
			
			if (place_meeting(x,y+2,oWall))
			{
				throwcount += 1;
		
				if (throwcount < 2)
				{
					sprite_index = sDogFall;
					image_index = 0;
			
				}
				else if (throwcount < 2*8)
				{
					sprite_index = sDogFall;
			
				}
				else if (throwcount < (2*8)+2)
				{
					sprite_index = sDogWinddown;
					image_index = 0;
			
			
			
				}
				else if (throwcount < (2*8)+(2*46))
				{
			
					sprite_index = sDogWinddown;
			
			
				}
				else
				{
					state = dogstates.sleep;
			
			
				}
			}
			else
			{
				throwaircount += 1;
				
				if (throwaircount < 2)
				{
					
					sprite_index = sDogFjumpStart;
					image_index = 0;
					
				}
				else if (throwaircount < 2*20)
				{
					sprite_index = sDogFjumpStart;
					
					
				}
				else 
				{
					sprite_index = sDogFjump;
					
				}
				
				
			}
		
		
		}
	*/
	
}









//destroy queue

