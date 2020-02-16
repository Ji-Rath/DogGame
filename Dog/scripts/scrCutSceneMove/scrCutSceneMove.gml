
var Object = argument0, Speed = argument1, XDest = argument2, YDest = argument3, Relative = argument4;

if(Relative)
{
    XDest += x;
    YDest += y;
}

with(Object)
{
    var Angle = point_direction(x,y,XDest,YDest);
    
    if(point_distance(x,y,XDest,YDest) > Speed)
    {
        HSpeed = lengthdir_x(Speed, Angle);
        VSpeed = lengthdir_y(Speed, Angle);
        x += HSpeed;
        y += VSpeed;
    }
    else
    {
        HSpeed = 0;
        VSpeed = 0;
        x = XDest;
        y = YDest;
        
        with(other)
        {
            scrCutSceneEnd();
        }
    }
    
    scrWalk();
}