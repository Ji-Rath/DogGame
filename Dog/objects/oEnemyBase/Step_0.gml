/// @description Insert description here

//If dead, turn invisible
if(Health <= 0)
	instance_destroy();

//Only move if visible and not in a cutscene
if(!instance_exists(oCutScene))
{
	TimerEnded = (timer[0] <= 0);
	
	//State machine
	switch(State)
	{
		case estates.Idle: scrEnemyIdle(); break;
		case estates.Wander: scrEnemyWander(); break;
		case estates.Alert: scrEnemyAlert(); break;
		case estates.Aggro: scrEnemyAggro(); break;
	}
	
	//Decrease timer
	if(timer[0] > 0)
		timer[0] -= 1;
}
else
{
	if(State = estates.Aggro || State = estates.Wander)
		path_end();
	State = estates.Idle;
}

//Movement
if (path_index != -1)
	Velocity = scrPathSpeed(Velocity);
scrMoveCollision(Velocity);
scrWalk(Velocity);

