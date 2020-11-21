function scrPathSpeed(Velocity)
{
	Velocity.X = x-PreviousPos.X;
	Velocity.Y = y-PreviousPos.Y;
	PreviousPos.X = x;
	PreviousPos.Y = y;
	return Velocity;
}
