
//Have NPC go to path if not in a cutscene
if(path_index == -1 && !instance_exists(oCutScene))
{
    if(floor(y) != floor(path_get_point_y(pathOldMan,0)) && floor(x) != floor(path_get_point_x(pathOldMan,0)))
    {
        var Path = path_add();
        if(mp_grid_path(global.AIGrid, Path, x, y, path_get_point_x(pathOldMan,0), path_get_point_y(pathOldMan,0), true))
        {
        	path_start(Path, Speed, path_action_stop, false);
        }
    }
    else
    {
        path_start(pathOldMan,Speed*2,path_action_restart,true);
    }
}

//Go to cutscene if player gets near
if(distance_to_object(oDog) < AlertDistance && !Used)
{
    path_end();
    HSpeed = 0;
    VSpeed = 0;
    scrCutScene(CSWarning);
    Used = true;
}

//Movement
scrPathSpeed();
scrMoveCollision();
scrWalk();

