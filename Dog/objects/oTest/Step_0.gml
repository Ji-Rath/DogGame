
//Split direction into x and y values
HSpeed = cos(degtorad(direction))*path_get_speed(path0,path_position);
VSpeed = -sin(degtorad(direction))*path_get_speed(path0,path_position);

//Walk animtion
scrWalk();

//Get X Change and Y Change to calculate image speed
var MoveX = x-OldX
if(MoveX != 0)
{
    OldX = x;
}
var MoveY = y-OldY
if(MoveY != 0)
{
    MoveY = y;
}
image_speed = (MoveX || MoveY);