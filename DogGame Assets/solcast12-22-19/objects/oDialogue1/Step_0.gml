

hsp= 0;
vsp = 0;


#region




	if (state == 1)
	{
		
			
		
			mySpeaker[0] = id;
			myText[0] = "ouch...";
			myNextLine[0] = -1;
			//myScripts[0] = 
			
		/*
			myText[1] = "im the only dog around here.";
			mySpeaker[1] = id;
			myNextLine[1] = -1;*/
			
			
			
			
			
			myScripts[0] = [statechange1,id,2,noone]
		
			create_dialogue(myText, mySpeaker, myEffects, myTextSpeed, myTypes, myNextLine, myScripts, myTextCol, myEmotion, myEmote);
			
			/*
			if (myTextbox.page = 0)
			{
				
				face = nddogface
				
			}
			else if (myTextbox.page = 1)
			{
				
				
			}*/
	
	}
	else if (state == 2)
	{
			instance_destroy(myTextbox);
			with (game)
			{
				beginningsleep = false;
				
				
			}
			state = 3;
			
			
		
		
	
	
	}
	else if (state == 3)
	{
		reset_dialogue_defaults();
	
		
		instance_destroy(id);
	
		
		
	
	
	
	}




	if (state != 3)
	{
	
		flowercount = 0;
	}

#endregion
