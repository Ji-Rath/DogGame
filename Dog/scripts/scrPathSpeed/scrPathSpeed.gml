function scrPathSpeed()
{
	var HSpeed = x-XPrevious;
	var VSpeed = y-YPrevious;
	XPrevious = x;
	YPrevious = y;
	return new Vector2(HSpeed, VSpeed);
}
