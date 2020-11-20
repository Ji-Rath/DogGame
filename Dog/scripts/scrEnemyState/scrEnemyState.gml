// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scrEnemyAggro()
{

	//Update speed
	Speed = RunSpeed;
	
	//Create path towards player
	var Path = path_add();
	if(mp_grid_path(global.AIGrid, Path, x, y, oDog.x, oDog.y, true))
	{
		path_start(Path, Speed, path_action_stop, false);
	}

	//If enemy is out of range + buffer, go to idle
	var PlayerDistance = point_distance(x,y,oDog.x,oDog.y);

	if (PlayerDistance > (DetectRange+BufferDistance))
	{
		State = estates.Idle;
		timer[0] = choose(1,2,3)*60;
		Velocity = new Vector2(0, 0);
	}
}

function scrEnemyAlert()
{
	sprite_index = SAlert;
	Velocity = new Vector2(0, 0);

	if(TimerEnded)
	{
		State = estates.Aggro;
	}
}

function scrEnemyDetect()
{
	var PlayerDistance = point_distance(x,y,oDog.x,oDog.y);
	if (PlayerDistance < DetectRange)
	{
		State = estates.Alert;
		timer[0] = 0.5*60;
	}
}

function scrEnemyIdle()
{

	//Turn to alert if player in range
	scrEnemyDetect();

	//Set speed to 0
	Velocity = new Vector2(0, 0);

	//Wander in a random direction if timer reaches 0
	if (TimerEnded)
	{
		State = estates.Wander;
		WanderDirectionX = choose(-1,1,0);
		WanderDirectionY = choose(-1,1,0);
		timer[0] = WanderInterval*60;
	}

	if(distance_to_object(oDog) < DetectRange)
	{
		State = estates.Alert;
		timer[0] = 0.5*60;
	}
}

function scrEnemyWander()
{
	//Aggro player if within range
	scrEnemyDetect();
	
	Speed = WalkSpeed;
	Velocity.X = WanderDirectionX*Speed;
	Velocity.Y = WanderDirectionY*Speed;

	//Movement animations
	scrWalk(Velocity);

	if (TimerEnded)
	{
		State = estates.Idle;
		timer[0] = choose(1,2,3)*60;
		Velocity = new Vector2(0, 0);
	}
}
