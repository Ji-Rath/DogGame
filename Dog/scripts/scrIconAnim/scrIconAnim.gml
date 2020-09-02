
/// @func scrAnimInit(AnimationPrimary, AnimationIntro)
/// @desc Initialize icon so animations can play properly
/// @arg {enum} AnimationPrimary
/// @arg {enum} AnimationIntro
function scrAnimInit()
{
	//Get script arguments
	var AnimationPrimary = argument_count > 0 ? argument[0] : -1;
	var AnimationIntro = argument_count > 1 ? argument[1] : -1;
	
	enum Animations
	{
	    Flip,
		IntroScale,
		SmoothFlip
	}
	
	//Setup timers
	for(i=0;i<3;i++)
	{
	    AnimationTimer[i] = -1;
	}
	
	//Internal variables
	AnimPrimary = AnimationPrimary;
	AnimIntro = AnimationIntro;
	
	//Variables to keep track of icon transform
	AnimFlipped = false;
	AnimRotation = 0;
	XPosInit = x;
	YPosInit = y;
	
	AnimAlpha = 1;
	AnimScale = 1;

	XPos = x;
	YPos = y;
	
	//Initial values for intro animations
	switch(AnimIntro)
	{
		case Animations.IntroScale:
			Scale = 0;
			break;
	}
}

/// @desc Draw icon with current values
function scrAnimDraw()
{
	if(!in_sequence)
		draw_sprite_ext(sprite_index, image_index, x,y, AnimScale, AnimScale, AnimRotation, c_white, AnimAlpha);
}

///@desc Step event for icon animations
function scrAnimStep()
{
	//Sequence management
	if(variable_instance_exists(self, "AnimSeq") && layer_sequence_exists(layer_get_id("GUI"), AnimSeq))
	{
		if(layer_sequence_is_finished(AnimSeq))
		{
			layer_sequence_destroy(AnimSeq);
			AnimIntro = -1;
		}
	}
	
	if(in_sequence) exit;
	
	//Decrement timers
	for(i=0;i<3;i++)
	{
	    if (AnimationTimer[i] > 0)
	        AnimationTimer[i] -= 1;
	    else if (AnimationTimer[i] != -1)
	    {
	        AnimationTimer[i] = -1;
	    }
	}

	//Play animations
	if(AnimPrimary != -1)
	{
		if(AnimIntro == -1)
		{
		    scrPlayAnimation(AnimPrimary);
		}
		else
		{
		    scrPlayAnimation(AnimIntro);
		}	
	}
	
}

/// @desc Play specified animation
/// @func scrPlayAnimation(AnimationEnum)
/// @arg {enum} AnimationEnum
function scrPlayAnimation(AnimationEnum)
{
	switch(AnimationEnum)
	{
		case Animations.IntroScale:
	        if (AnimScale < 1)
	            AnimScale += 0.075;
				
	        if (AnimRotation < 360)
	            AnimRotation += 30;
				
	        if (AnimScale >= 1 && AnimRotation >= 360) //Animation finished
	            AnimIntro = -1;
			break;
		case Animations.Flip:
		    if (AnimationTimer[0] = -1)
		    {
			    AnimationTimer[0] = 0.5*60;
			    AnimFlipped = !AnimFlipped;
				
			    if(AnimFlipped)
			        AnimRotation = 15;
			    else
			        AnimRotation = -15;
		    }
			break;
		case Animations.SmoothFlip:
			//Rotate effect
		    Rot += (2*pi)/120;
		    AnimRotation = sin(Rot)*25;
		    if(Rot > 2*pi)
		    {
		        Rot = 0;
		    }
	}
}

function scrPlaySequence(Sequence)
{
	AnimSeq = layer_sequence_create("GUI", XPosInit, YPosInit, Sequence);
	var AnimSeqInstance = layer_sequence_get_instance(AnimSeq);
	sequence_instance_override_object(AnimSeqInstance, oButtonRage, self);
}