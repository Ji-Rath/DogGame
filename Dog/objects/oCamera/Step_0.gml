

 
//Update destination values if following object is valid
if (instance_exists(Follow))
{
	XDestination = Follow.x;
	YDestination = Follow.y;
}

//Update camera object position for smooth movement
x += (XDestination - x) / 4;
y += (YDestination - y) / 7;

//Update the actual camera position
camera_set_view_pos(Camera,x-ViewWidthHalf,y-ViewHeightHalf);

//Calculate camera shake
x += random_range(-ShakeRemain,ShakeRemain);
y += random_range(-ShakeRemain,ShakeRemain);
ShakeRemain = max(0,ShakeRemain-((1/ShakeLength)*ShakeMagnitude));
		
		
		
		
		
		
		
		
		
		
		