
//Split direction into x and y values
if(path_index != -1)
{
    var Dir = 180+point_direction(x,y,path_get_x(path_index,path_position-0.01),path_get_y(path_index,path_position-0.01));
    HSpeed = cos(degtorad(Dir))*WalkSpeed;
    VSpeed = -sin(degtorad(Dir))*WalkSpeed;
    //path_get_speed(path_index,path_position)
}