
var Player = instance_find(oDog,0);
if(place_meeting(x,y,Player) && y > Player.y)
    image_alpha = 0.5;
else
    image_alpha = 1;
