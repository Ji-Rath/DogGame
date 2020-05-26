

hsp= 0;
vsp = 0;


#region

	if (state == 1)
	{
		
			
		
			mySpeaker[0] = oPlayer;
			myText[0] = "....";
			myNextLine[0] = 1;
			//myScripts[0] = 
			
		
		
			myScripts[1] = [statechange1,id,2,noone]
			
			mySpeaker[1] = oPlayer;
			myText[1] = "...hello?"
			myNextLine[1] = -1
		
			create_dialogue(myText, mySpeaker, myEffects, myTextSpeed, myTypes, myNextLine, myScripts, myTextCol, myEmotion, myEmote);
			
			
			if (myTextbox.page = 0)
			{
				oPlayer.face = sPlayerconfusedearnest;
				
				
			}
			else if (myTextbox.page = 1)
			{
				oPlayer.face = sPlayerconfusedgood;
				
			}
	
	}
	else if (state == 2)
	{
			instance_destroy(myTextbox);

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
