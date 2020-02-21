
//Split direction into x and y values
if(path_index != -1)
{
    HSpeed = cos(degtorad(direction))*path_get_speed(path_index,path_position);
    VSpeed = -sin(degtorad(direction))*path_get_speed(path_index,path_position);
}