function scrEnemyWander() {

	scrEnemyDetect();

	Speed = WalkSpeed;
	HSpeed = WanderDirectionX*Speed;
	VSpeed = WanderDirectionY*Speed;

	//Movement animation
	scrWalk();

	if (TimerEnded)
	{
		State = estates.Idle;
		timer[0] = choose(1,2,3)*60;
		HSpeed = 0;
		VSpeed = 0;
	}

	if(distance_to_object(oDogPaddler) < DetectRange)
	{
		State = estates.Alert;
		timer[0] = 0.5*60;
	}


}
