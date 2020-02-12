/// @description Insert description here
// You can write your code in this editor

//If in battle room or dead, turn invisible
visible = !((room == rmBattle) || (Health <= 0));

//Only move if visible
if(visible)
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
}
else 
{
	HSpeed = 0;
	VSpeed = 0;
}


//Decrease timer
if(timer[0] > 0)
{
	timer[0] -= 1;
}

//Movement collision
scrMoveCollision();
