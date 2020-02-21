/// @param Object
/// @param Speed
/// @param ObjectFollow
/// @param DistanceFinish = 0
/// @func scrCutSceneMove(Object, Speed, X, Y, Relative, DistanceFinish)
var Object = argument[0], Speed = argument[1], ObjectFollow = argument[2];
var DistanceFinish = argument_count > 3 ? argument[3] : 0;

with(Object)
{
    var Angle = point_direction(x,y,ObjectFollow.x,ObjectFollow.y);
    var Distance = point_distance(x,y,ObjectFollow.x,ObjectFollow.y);
    
    if(Distance < DistanceFinish)
    {
        HSpeed = 0;
        VSpeed = 0;
        if(DistanceFinish = 0)
        {
            x = ObjectFollow.x;
            y = ObjectFollow.y;
        }
        
        with(other)
        {
            scrCutSceneEnd();
        }
    }
    else if(Distance > Speed)
    {
        HSpeed = lengthdir_x(Speed, Angle);
        VSpeed = lengthdir_y(Speed, Angle);
    }
    else
    {
        HSpeed = 0;
        VSpeed = 0;
        if(DistanceFinish = 0)
        {
            x = ObjectFollow.x;
            y = ObjectFollow.y;
        }
        
        with(other)
        {
            scrCutSceneEnd();
        }
    }
}