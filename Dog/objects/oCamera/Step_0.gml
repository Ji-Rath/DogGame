

 
//update position

if (instance_exists(Follow))
{
	XDestination = Follow.x;
	YDestination = Follow.y;
}

//update object position
x += (XDestination - x) / 4;
y += (YDestination - y) / 7;

//update camera view
camera_set_view_pos(Camera,x-ViewWidthHalf,y-ViewHeightHalf);
		
x += random_range(-ShakeRemain,ShakeRemain);
y += random_range(-ShakeRemain,ShakeRemain);
ShakeRemain = max(0,ShakeRemain-((1/ShakeLength)*ShakeMagnitude));
		
		
		
		
		
		
		
		
		
		
		