/// @description Insert description here
// You can write your code in this editor

//If in battle room or dead, turn invisible
visible = !((room == rmBattle) || (Health <= 0));

//Only move if visible and not in a cutscene
if(visible && instance_exists(oDogPaddler) && !instance_exists(oCutScene))
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
	HSpeed = 0;
	VSpeed = 0;
}

//Go to idle if not moving
if(HSpeed == 0 && VSpeed == 0)
{
	sprite_index = SIdle;
}

//Movement collision
scrMoveCollision();



//Depth
depth = -y;
