
//Turn to alert if player in range
scrEnemyDetect();

//Set speed to 0
HSpeed = 0;
VSpeed = 0;

//Wander in a random direction if timer reaches 0
if (TimerEnded)
{
	State = estates.Wander;
	WanderDirectionX = choose(-1,1,0);
	WanderDirectionY = choose(-1,1,0);
	timer[0] = choose(1,2,3)*60;
}

if(distance_to_object(oDogPaddler) < DetectRange)
{
	State = estates.Alert;
	timer[0] = 0.5*60;
}
