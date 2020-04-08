
event_inherited();

if(timer[0] > 0)
{
    timer[0] -= 1;
}
else
{
    Speed = WalkSpeed;
    var Path = path_add();
    if(mp_grid_path(global.AIGrid, Path, x, y, oDogPaddler.x, oDogPaddler.y, true))
    {
    	path_start(Path, Speed, path_action_stop, false);
    }
    timer[0] = 0.25*60;
}

if(distance_to_object(oDogPaddler) < Distance)
{
    path_end();
    HSpeed = 0;
    VSpeed = 0;
}

scrWalk();
scrPathSpeed();