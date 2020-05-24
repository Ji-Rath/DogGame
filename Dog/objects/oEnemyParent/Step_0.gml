/// @description Insert description here
// You can write your code in this editor

//If in battle room or dead, turn invisible
if(Health <= 0)
	Destroyed = true;

//Only move if visible and not in a cutscene
if(!instance_exists(oCutScene) && !Destroyed)
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
	{
		timer[0] -= 1;
	}
}
else
{
	if(State = estates.Aggro || State = estates.Wander)
	{
		HSpeed = 0;
		VSpeed = 0;
		path_end();
	}
	State = estates.Idle;
}

//Movement
scrPathSpeed();
scrMoveCollision();
scrWalk();

XPrevious = x;
YPrevious = y;

