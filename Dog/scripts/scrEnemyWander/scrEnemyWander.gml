
scrWalk();
scrEnemyDetect();

WalkSpd = 2;
HSpeed = WanderDirectionX*WalkSpd;
VSpeed = WanderDirectionY*WalkSpd;



if (TimerEnded)
{
	State = estates.Idle;
	timer[0] = choose(1,2,3)*60;
}

if(distance_to_object(oDogPaddler) < DetectRange)
{
	State = estates.Alert;
	timer[0] = 0.5*60;
}