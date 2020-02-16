
var Object = argument0, Path = argument1, Speed = argument2;

with(Object)
{
    if(path_position = 1)
    {
        path_end();
        HSpeed = 0;
        VSpeed = 0;
        other.OldX = 0;
        other.OldY = 0;
        scrCutSceneEnd();
        exit;
    }
    
    if(path_index = -1)
    {
        path_start(Path,Speed,path_action_stop,true);
    }
    
    //Get X Change and Y Change to calculate image speed
    var MoveX = x-other.OldX
    if(MoveX != 0)
    {
        other.OldX = x;
    }
    var MoveY = y-other.OldY
    if(MoveY != 0)
    {
        MoveY = y;
    }
    image_speed = (MoveX || MoveY);
    
    //Split direction into x and y values
    HSpeed = cos(degtorad(direction))*path_get_speed(Path,path_position);
    VSpeed = -sin(degtorad(direction))*path_get_speed(Path,path_position);
}