event_inherited(); //so it will inherit from par_speaker


if (instance_exists(myTextbox))
{
	var decision = myTextbox.choice;
	
		
	if (myTextbox.page == 0)
	{
		face = sMelvinhappy;
			
	}
	/*else if (myTextbox.page == 1)
	{
				
		if(decision = 0)
		{
			decidecount1 += 1;
			decidecount2 = 0;
				
			if (decidecount1 < 3)
			{
				oPlayer.face = sBlank;
					
			}
			else
			{
				oPlayer.face = sPlayerconfusedgood;
			}
					
					
		}
		else
		{
			decidecount2 += 1;
			decidecount1 = 0;
				
			if (decidecount2 < 3)
			{
				oPlayer.face = sBlank;
					
			}
			else
			{
				oPlayer.face = sPlayersad;
			}
			
		}
		
			
			
			
				
	}*/
	else if (myTextbox.page == 1)
	{
		
	}
	else if (myTextbox.page == 11)
	{
		face = sMelvinsad;
			
	}
	else if (myTextbox.page == 2)
	{
		face = sMelvinhappy;
			
	}
	else if (myTextbox.page == 4)
	{
		face = sMelvinhappy;
			
	}
	else if (myTextbox.page == 5)
	{
		if(decision = 0)
		{
			decidecount1 += 1;
			decidecount2 = 0;
				
			if (decidecount1 < 3)
			{
				oPlayer.face = sBlank;
					
			}
			else
			{
				oPlayer.face = sPlayerconfusedgood;
			}
					
					
		}
		else if (decision = 1)
		{
				
				
			decidecount1 = 0;
			decidecount2 += 1;
				
			if (decidecount2 < 3)
			{
				oPlayer.face = sBlank;
					
			}
			else
			{
				oPlayer.face = sPlayerhappy;
			}
			
			
			
		}
			
	}
	else if (myTextbox.page == 7)
	{
		face = sMelvinsad;
			
	}
	else if (myTextbox.page == 8)
	{
		if (decision = 0)
		{
				
				
			decidecount1 = 0;
			decidecount2 += 1;
				
			if (decidecount2 < 3)
			{
				oPlayer.face = sBlank;
					
			}
			else
			{
				oPlayer.face = sPlayerhappy;
			}
			
			
			
		}
			
	}
		
			
			
			
			
			

		
		
	
	
}


/*

Other code
codecodecode

if (instance_exists(obj_textbox))
{
	emotionchoice = obj_textbox.choice;
	
	
}