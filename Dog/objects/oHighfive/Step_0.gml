
ImageIndex += ImageSpeed;
if (CanAttempt)
{
	if(ceil(ImageIndex) > sprite_get_number(sHandClap))
		CompletedHighfive(false);
	ImageIndex = ImageIndex % (sprite_get_number(sHandClap));
	
	if(input_check_press(EVerb.Interact))
	{
	    if(ceil(ImageIndex) > IndexCorrectMin && ceil(ImageIndex) < IndexCorrectMax)
	    {
	        CompletedHighfive(true);
	    }
		else
		{
			CompletedHighfive(false);
		}
	}
}

