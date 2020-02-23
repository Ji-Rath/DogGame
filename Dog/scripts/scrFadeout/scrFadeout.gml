/// @func scrFadeOut(room, fadecolor, fadespeed)
/// @desc Fade into a different room
/// @arg Room
/// @arg Color
/// @arg FadeSpeed
/// @arg XDest = 0
/// @arg YDest = 0
/// @arg Sprite = 0
/// @arg SpriteXScale = 0
var Room = argument[0], Color = argument[1], FadeSpeed = argument[2];
var XDest = argument_count > 3 ? argument[3] : 0;
var YDest = argument_count > 4 ? argument[4] : 0;
var Sprite = argument_count > 5 ? argument[5] : 0;
var SpriteXScale = argument_count > 6 ? argument[6] : 0;
if(!instance_exists(oFade))
{
    var Fade = instance_create_depth(0,0,0,oFade);
    
    Fade.Target = Room;
    Fade.FadeColor = Color;
    Fade.FadeSpeed = FadeSpeed;
    if(XDest != 0)
    {
        Fade.XDest = XDest;
        Fade.YDest = YDest;
        Fade.Sprite = Sprite;
        Fade.SpriteXScale = SpriteXScale;
    }
    show_debug_message(room_get_name(Room));
}