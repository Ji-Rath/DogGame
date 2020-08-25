
var Player = instance_find(oDogPaddler,0);
if(place_meeting(x,y,oDogPaddler) && y > Player.y)
    image_alpha = 0.5;
else
    image_alpha = 1;
