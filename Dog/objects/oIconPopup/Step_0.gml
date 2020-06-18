
//Increase value of scale and decrease alpha over time
if(FadeAway)
{
    image_alpha -= 0.04;
    Scale += 0.05;
}
else
{
    image_alpha += 0.075;
    Scale += 0.1;
    if(image_alpha >= 1)
        FadeAway = true;
}

if(image_alpha <= 0)
    instance_destroy();