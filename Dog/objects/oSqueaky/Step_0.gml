// pick up the ball
if place_meeting(x,y,oDog)
{
	if keyboard_check_pressed(ord("X"))
	{
		oSqueakyThrow.PickedUp = true;
		instance_destroy(oSqueaky);
	}
}
	
	
// throw the ball

if speed > 0
{
	image_angle += 10;
}

// Bounce off wall implementation
var Velocity = new Vector2(hspeed, vspeed);
if (HTileCollision(Velocity))
	hspeed = -hspeed;
if (VTileCollision(Velocity))
	vspeed = -vspeed;