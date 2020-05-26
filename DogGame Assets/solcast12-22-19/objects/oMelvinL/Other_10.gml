//---You can update variables here!---//
reset_dialogue_defaults();


switch(choice_variable){
	case -1:
	#region First Dialogue
		//Line 0
		
		
		
		
		mySpeaker[0] = id;
		myText[0] = "Oh hey, you found me! ";
		myNextLine[0] = 1;
		
		
		
		myText[1] = "unfortunately this section of the map is still under construction"
		//myTypes[1] = 1;
		mySpeaker[1] = id;
		myNextLine[1] = 11;
		
		
		myText[11] = "...So I don't have any rewards for you just yet."
		mySpeaker[11] = id;
		myNextLine[11] = -1;
		
		
		
		
		
		
		/// outfit
		
		myText[2] = "Oh, right! It took a while for me to come up with one too."
		mySpeaker[2] = id;
		myNextLine[2] = 4;
		
		myText[4] = "Actually, I didn't come up with one, my friends just started calling me Melvin!";
		mySpeaker[4] = id;
		myNextLine[4] = 5;
		
		myText[5] = ["'Melvin? That's a funny name.'","'Melvin... I like it!'"]
		myTypes[5] = 1;
		mySpeaker[5] = player;
		myNextLine[5] = [7,6]
		
		
		
		myText[6] = "You do? "
		mySpeaker[6] = id;
		myNextLine[6] = 3;
		
		myText[7] = "Oh... okay."
		mySpeaker[7] = id;
		myNextLine[7] = -1;
		
		
		
		
		
		///short
		
		myText[3] = "When you come up with a name, you can apply for an ID at the Town Hall."
		mySpeaker[3] = id;
		myNextLine[3] = 8;
		myEmotion[3] = 1;
		
		myText[8] = ["'Thanks!'"]
		myTypes[8] = 1;
		mySpeaker[8] = player;
		myNextLine[8] = [10]
		
		myText[9] = "Yep!"
		mySpeaker[9] = id;
		myNextLine[9] = -1;
		
		
		myText[10] = "Anytime!"
		mySpeaker[10] = id;
		myNextLine[10] = -1;
		
		myText[12] = "";
		mySpeaker[12] = id;
		myNextLine[12] = -1;
		
		
		
		
		
		

		#endregion
	break;
	
	
	
	

}