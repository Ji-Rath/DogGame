function scrPathSpeed(Velocity)
{
	Velocity.X = x-XPrevious;
	Velocity.Y = y-YPrevious;
	XPrevious = x;
	YPrevious = y;
	return Velocity;
}
