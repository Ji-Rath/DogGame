
image_alpha -= 0.025;
image_angle += 7;
x += HSpeed;

if(image_alpha < 0)
{
    instance_destroy();
}