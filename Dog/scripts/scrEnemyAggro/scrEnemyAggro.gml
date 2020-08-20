function scrEnemyAggro() {

	//Update speed
	Speed = WalkSpeed*1.5;
	var Path = path_add();
	if(mp_grid_path(global.AIGrid, Path, x, y, oDog.x, oDog.y, true))
	{
		path_start(Path, Speed, path_action_stop, false);
	}

	//If enemy is out of range + buffer, go to idle
	var PlayerDistance = point_distance(x,y,oDog.x,oDog.y);
	var Buffer = 100;
	if (PlayerDistance > (DetectRange+Buffer))
	{
		State = estates.Idle;
		timer[0] = choose(1,2,3)*60;
		HSpeed = 0;
		VSpeed = 0;
	}
}
