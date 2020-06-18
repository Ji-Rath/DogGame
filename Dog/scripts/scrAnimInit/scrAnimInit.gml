
//Initialize animation variables
var AnimationType = argument[0];
var AnimationIntro = argument_count > 1 ? argument[1] : -1;

for(i=0;i<3;i++)
{
    AnimationTimer[i] = -1;
}

Anim = AnimationType;
AnimIntro = AnimationIntro;
AnimFlipped = false;
AnimRotation = 0;
AnimAlpha = 1;
if (AnimIntro == -1)
    AnimScale = 1;
else
    AnimScale = 0;

enum Animation
{
    Flip
}

enum AnimationIntro
{
    Intro1
}
