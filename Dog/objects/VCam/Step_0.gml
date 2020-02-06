

 
//update position

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
x += (xTo - x) / 4;
y += (yTo - y) / 7;

//update camera view
camera_set_view_pos(cam,x-view_w_half,y-view_h_half);
		
x += random_range(-shake_remain,shake_remain);
y += random_range(-shake_remain,shake_remain);
shake_remain = max(0,shake_remain-((1/shake_length)*shake_magnitude));
		
		
		
		
		
		
		
		
		
		
		