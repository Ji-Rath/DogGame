
event_inherited();

if(timer[0] > 0)
{
    timer[0] -= 1;
}
else
{
    if(point_distance(self.x, self.y, oDog.x, oDog.y) > 200)
    {
        Speed = WalkSpeed*2
    }
    else
    {
        Speed = WalkSpeed;
    }
    var Path = path_add();
    if(mp_grid_path(global.AIGrid, Path, x, y, oDog.x, oDog.y, true))
    {
    	path_start(Path, Speed, path_action_stop, false);
    }
    timer[0] = 0.2*60;
}

if(distance_to_object(oDog) < Distance)
{
    path_end();
    HSpeed = 0;
    VSpeed = 0;
}

scrWalk();
scrPathSpeed();