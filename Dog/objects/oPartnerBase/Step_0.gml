
event_inherited();
	
if (ds_queue_size(CrumbQueue) > StepsBehind)
{
	var CurrentCrumb = ds_queue_dequeue(CrumbQueue);
	
	Speed = distance_to_object(CurrentCrumb) > 16 || oDog.Speed == RunSpeed ? RunSpeed : WalkSpeed;
	
	if (instance_exists(CurrentCrumb))
	{
		//Create path to follow player
		var Path = path_add();
		if(mp_grid_path(global.AIGrid, Path, x, y, CurrentCrumb.x, CurrentCrumb.y, true))
		{
			path_start(Path, Speed, path_action_stop, false);
		}
	}
		
	if (LastPartnerIndex == StepsBehind)
		instance_destroy(CurrentCrumb);
}

if(path_index != -1)
{
	Velocity = scrPathSpeed(Velocity);
}
else
{
	Velocity.Set(0);
}

scrWalk(Velocity);

