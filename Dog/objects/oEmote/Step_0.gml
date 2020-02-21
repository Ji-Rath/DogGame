
//Destroy object after timer is finished
if(Time > 0)
    Time -= 1;
else
    instance_destroy();

//Set image alpha proportional to time
image_alpha = 0.5+(Time/60);

//Increase height of emote
y -= 1;