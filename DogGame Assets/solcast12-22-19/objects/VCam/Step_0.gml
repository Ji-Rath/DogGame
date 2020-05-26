

 
//update position
if (instance_exists(oPlayer))
{
	if (state = camstates.followplayer)
	{
		if (instance_exists(follow))
		{
		
			/*
			if(follow.touchx != true)
			{
			
			xTo = follow.x + ((follow.hsp)*10);
		
			}
			else
			{
			
				xTo = follow.x
			
			}*/
			xTo = follow.x;
			yTo = follow.y;
		}

		//update object position
		x = follow.x
		y += (yTo - y) / 7;

		//update camera view
		camera_set_view_pos(cam,x-view_w_half,y-view_h_half);
		
		x += random_range(-shake_remain,shake_remain);
		y += random_range(-shake_remain,shake_remain);
		shake_remain = max(0,shake_remain-((1/shake_length)*shake_magnitude));
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}
	else if (state = camstates.swoop)
	{
		if (instance_exists(follow))
		{
			var playerdirx = sign(follow.x - x);
			var playerdiry = sign(follow.y - y)
			var camspeed = 0.15;
		
			var distancetoplayery = (follow.y - y)
		
			hsp += camspeed*playerdirx;
			vsp += camspeed*playerdiry;
		
			hsp *= 0.7;
		
			x += hsp;
			y += vsp;
		
			if (distancetoplayery < 200)
			{
			
				state = camstates.followplayer;
				if (game.juststarted == true)
				{
					with (game)
					{
						cutscene1 = true;
					
					}
				
				}
			
			}
		
		
		
		}


		//update camera view
		camera_set_view_pos(cam,x-view_w_half,y-view_h_half);

}
else if (state = camstates.pause)
{
	var pausesecs = 1.1;
	pausecount += 1;
	
	
	if (pausecount > pausesecs*60)
	{
		state = camstates.swoop;
		
	}
	camera_set_view_pos(cam,x-view_w_half,y-view_h_half);
	
}

}
/*
if (follow.hsp < 0)
{
	hinc++;
		
}
else if (follow.hsp > 0)
{
	hinc--;
		
}

if (follow.vsp < 0)
{
	vinc+= offsetspeed;
	
}
else if (follow.vsp > 0)
{
	vinc-= offsetspeed;
}
	*/
	
	if (instance_exists(follow))
	{
		// set speed for offset
		/*
		if (follow.hsp > 0)
		{
			speedoffsetx --;
			
		}
		if (follow.hsp < 0)
		{
			speedoffsetx ++;
		}
		*/
		speedoffsetx = -follow.hsp;
	
	
		// reset speed to zero
		if (follow.hsp = 0)
		{
			speedoffsetx = 0;
		}

		//increment friction
		//var offsetfriction = 0.9;
		//speedoffsetx *= offsetfriction;
		//speedoffsety *= offsetfriction;
		
		hinc += speedoffsetx;
		
	}
	

if (layer_exists("parallax1"))
{
	var parallax1inc = 20
	layer_x("parallax1",x+(hinc/parallax1inc));
	layer_y("parallax1",(y/1.005)-900);
	
	
	

}
if (layer_exists("fg1"))
{
	countnew -= 1;
	layer_x("fg1",countnew);
	
}


/*
if (layer_exists("par2"))
{
	layer_x("par2",x/2);
	layer_y("par2",(y/2)-200);
	
	
}
if (layer_exists("parcavebd"))
{
	layer_x("parcavebd",x/2);
	layer_y("parcavebd",(y/2)+1100);
	
	
}


if (layer_exists("parbd2"))
{
	layer_x("parbd2",(x/1.05)+500);
	layer_y("parbd2",(y/1.05)+500);
	
	
}
if (layer_exists("parbdfar"))
{
	layer_x("parbdfar",(x/1.01)+500);
	layer_y("parbdfar",(y/1.01)+300);
	
	
}
if (layer_exists("parbd3"))
{
	layer_x("parbd3",(x/1.05)+600);
	//layer_x("parbd3",x+1200);
	layer_y("parbd3",(y/1.1)-500);
	
	
}
if (layer_exists("parbd"))
{
	layer_x("parbd",x/1.7);
	layer_y("parbd",y/1.7);
	
	
}


if (layer_exists("parbdcloud"))
{
	cloudcount += 1;
	layer_x("parbdcloud",(x/1.7)+(cloudcount*1.2));
	layer_y("parbdcloud",(y/1.7)-300);
	
	
}

if (layer_exists("par2cloud"))
{
	layer_x("par2cloud",(x/1.3)+(cloudcount/2));
	layer_y("par2cloud",(y/1.3)-500);
	
	
}

if (layer_exists("clouds"))
{
	layer_x("clouds",x/1.5);
	layer_y("clouds",(y)-450);
	
	
}


if (layer_exists("clouds2"))
{
	layer_x("clouds2",x/1.7);
	layer_y("clouds2",(y)-450);
	
	
}

if (layer_exists("clouds3"))
{
	layer_x("clouds3",x/1.9);
	layer_y("clouds3",(y)-550);
	
	
}



skyheight = sprite_get_height(psky);
skywidth = sprite_get_width(psky);

if (layer_exists("sky"))
{
	layer_x("sky",x-(skywidth/2));
	layer_y("sky",y+(skyheight/2));
	
	
}


if (layer_exists("par7"))
{
	layer_x("par7",x/3);
	layer_y("par7",(y/3)+200);
	
	
}

if (layer_exists("par1"))
{
	layer_x("par1",(x+12818)/7);
	layer_y("par1",((y-268)/7));
	
	
	
}


if (layer_exists("par3"))
{
	layer_x("par3",-1.2*x);
	layer_y("par3",-1.2*(y-1360));
	
	
	
}


if (layer_exists("par6"))
{
	layer_x("par6",-2*x);
	layer_y("par6",-2*(y-1380));
	
	
	
}

if (layer_exists("par4"))
{
	layer_x("par4",-0.4*x);
	layer_y("par4",-0.4*(y-3150));
	
	
	
}


if (layer_exists("par5"))
{
	layer_x("par5",-0.2*(x+12722));
	layer_y("par5",-0.2*(y-787));
	
	
	
}
/*
if (layer_exists("par5"))
{
	layer_x("par5",-0.2*x);
	layer_y("par5",-0.2*(y-5350));
	
	
	
}*/
