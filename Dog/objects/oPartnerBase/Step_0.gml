
event_inherited();

//Check player distance at a specified interval
if(timer[0] > 0)
{
    timer[0] -= 1;
}
else
{
	//Check distance from object, change to running if far away
    if(point_distance(x, y, FollowObject.x, FollowObject.y) >= RunningDistance)
    {
        Speed = RunSpeed;
    }
    else
    {
        Speed = WalkSpeed;
    }
	
	//Check distance from object to stop following
	if(distance_to_object(FollowObject) <= Distance)
	{
	    path_end();
		Velocity = new Vector2(0, 0);
	}
	else
	{
		//Create path to follow player
	    var Path = path_add();
	    if(mp_grid_path(global.AIGrid, Path, x, y, FollowObject.x, FollowObject.y, true))
	    {
	    	path_start(Path, Speed, path_action_stop, false);
	    }
	}
	
    timer[0] = IntervalCheckDelay;
}

if(path_index != -1)
	Velocity = scrPathSpeed();

scrWalk(Velocity);

