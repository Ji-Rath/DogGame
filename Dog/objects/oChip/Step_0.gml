
//Bounce off minigame boundaries
if(speed > 0)
{
    if(y > room_height/2+250 || y < room_height/2-250)
    {
        direction = -direction;
        image_angle = random(360);
    }
    if(x > room_width/2+500 || x < room_width/2-500)
    {
        direction = 180-direction;
        image_angle = random(360);
    }
    image_angle += speed;
    x += lengthdir_x(speed,direction);
    y += lengthdir_y(speed,direction);
    speed -= friction;
}