
//Split direction into x and y values
if(path_index != -1)
{
    var Dir = 180+point_direction(x,y,path_get_x(path_index,path_position-0.1),path_get_y(path_index,path_position-0.1));
    HSpeed = cos(degtorad(Dir))*path_get_speed(path_index,path_position);
    VSpeed = -sin(degtorad(Dir))*path_get_speed(path_index,path_position);
}