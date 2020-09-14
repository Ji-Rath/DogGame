
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
		SmoothFlip,
		FadeIn,
		FadeOut
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
	AnimRot = 0;
	XPosInit = x;
	YPosInit = y;
	
	AnimAlpha = 1;
	InitAnimScale = image_xscale;
	AnimScale = InitAnimScale;

	XPos = x;
	YPos = y;
	
	SpeedMultiplier = 1;
	if(instance_exists(oBattleManager))
		SpeedMultiplier = oBattleManager.SpeedMultiplier;
	
	//Initial values for intro animations
	switch(AnimIntro)
	{
		case Animations.IntroScale:
			AnimScale = 0;
			break;
		case Animations.FadeIn:
			AnimAlpha = 0;
			break;
	}
}

function scrAnimReinit(AnimationPrimary, AnimationIntro)
{
	AnimPrimary = AnimationPrimary;
	AnimIntro = AnimationIntro;
	
	SpeedMultiplier = 1;
	if(instance_exists(oBattleManager))
		SpeedMultiplier = oBattleManager.SpeedMultiplier;
	
	switch(AnimIntro)
	{
		case Animations.IntroScale:
			AnimScale = 0;
			AnimAlpha = 1;
			break;
		case Animations.FadeIn:
			AnimAlpha = 0;
			AnimScale = InitAnimScale;
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
	if(AnimIntro != -1)
	{
		scrPlayAnimation(AnimIntro);
	}
	
	if(AnimPrimary != -1)
	{
		scrPlayAnimation(AnimPrimary);
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
	        if (AnimScale < InitAnimScale)
	            AnimScale += 0.075;
				
	        if (AnimRotation < 360)
	            AnimRotation += 15;
				
	        if (AnimScale >= 1 && AnimRotation >= 360) //Animation finished
	            AnimIntro = -1;
			break;
		case Animations.Flip:
		    if (AnimationTimer[0] = -1)
		    {
			    AnimationTimer[0] = (0.5/SpeedMultiplier)*60;
			    AnimFlipped = !AnimFlipped;
				
			    if(AnimFlipped)
			        AnimRotation = 15;
			    else
			        AnimRotation = -15;
		    }
			break;
		case Animations.SmoothFlip:
			//Rotate effect
		    AnimRot += (SpeedMultiplier/4)/(2*pi);
		    AnimRotation = sin(AnimRot)*20;
		    if(AnimRot >= 2*pi)
		        AnimRot = 0;
			break;
		case Animations.FadeIn:
			AnimAlpha = clamp(AnimAlpha+0.05*SpeedMultiplier, 0, 1);
			if(AnimAlpha >= 1)
				AnimIntro = -1;
			break;
		case Animations.FadeOut:
			AnimAlpha = clamp(AnimAlpha-0.05*SpeedMultiplier, 0, 1);
			if(AnimAlpha <= 0)
				AnimIntro = -1;
			break;
	}
}

function scrPlaySequence(Sequence)
{
	AnimSeq = layer_sequence_create("GUI", XPosInit, YPosInit, Sequence);
	var AnimSeqInstance = layer_sequence_get_instance(AnimSeq);
	sequence_instance_override_object(AnimSeqInstance, oButtonRage, self);
	layer_sequence_speedscale(AnimSeq, SpeedMultiplier);
}

function scrAnimVisible()
{
	return AnimAlpha >= 1 || AnimScale >= InitAnimScale;
}