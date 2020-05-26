

hsp= 0;
vsp = 0;

if (game.juststarted = true)
{
#region

	if (state == 1)
	{
		
			
		
			mySpeaker[0] = oPlayer;
			myText[0] = "...A shovel?";
			myNextLine[0] = -1;
			
		
			myText[1] = "A shovel?";
			mySpeaker[1] = id;
			myNextLine[1] = -1;
			myScripts[0] = [statechange1,oFlower,2,noone]
		
			create_dialogue(myText, mySpeaker, myEffects, myTextSpeed, myTypes, myNextLine, myScripts, myTextCol, myEmotion, myEmote);
			
			
			if (myTextbox.page = 0)
			{
				oPlayer.face = sPlayerconfusedtrue;
				
			}
			else if (myTextbox.page = 1)
			{
				oPlayer.face = sPlayerconfusedtrue;
				
			}
	
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
	
		oPlayer.state = states.Playeremptynormal;
		instance_destroy(id);
	
			
		
	
	
	
	}




	if (state != 3)
	{
	
		flowercount = 0;
	}

#endregion

}