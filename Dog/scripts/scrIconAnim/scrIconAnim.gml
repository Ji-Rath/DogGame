function scrAnimInit() {

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
}

function scrAnimDraw() {

	draw_sprite_ext(sprite_index, image_index, x,y, AnimScale, AnimScale, AnimRotation, c_white, AnimAlpha);
}


function scrAnimStep() {

	for(i=0;i<3;i++)
	{
	    if (AnimationTimer[i] > 0)
	        AnimationTimer[i] -= 1;
	    else if (AnimationTimer[i] != -1)
	    {
	        AnimationTimer[i] = -1;
	    }
	}


	if(AnimIntro == -1)
	{
	    switch(Anim)
	    {
	        case Animation.Flip:
	             if (AnimationTimer[0] = -1)
	             {
	                AnimationTimer[0] = 0.5*60;
	                AnimFlipped = !AnimFlipped;
	                if(AnimFlipped)
	                {
	                    AnimRotation = 15;
	                }
	                else
	                {
	                    AnimRotation = -15;
	                }
	             }
	        break;
	    }
	}
	else
	{
	    switch(AnimIntro)
	    {
	        case AnimationIntro.Intro1:
	            if (AnimScale < 1)
	                AnimScale += 0.075;
	            if (AnimRotation < 360)
	                AnimRotation += 30;
	            if (AnimScale >= 1 && AnimRotation >= 360)
	                AnimIntro = -1;
	        break;
	    }
	}


}