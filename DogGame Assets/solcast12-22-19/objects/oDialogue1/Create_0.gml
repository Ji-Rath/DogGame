event_inherited(); //so it will inherit from par_speaker


//-------DIALOGUE STUFF

myPortrait			= sBlank;
myVoice				= noone//snd_voice1;
myName				= "";
Username = "Melvin"
face = sBlank;


/*
myPortraitTalk		= spr_portrait_examplechar_mouth;
myPortraitTalk_x	= 26;
myPortraitTalk_y	= 44;
myPortraitIdle		= spr_portrait_examplechar_idle;
*/

//-------OTHER

choice_variable		= -1;	//the variable we change depending on the player's choice in dialogue
eventdialogue = 0;

/*

		myText[i]		
		myTextSpeed[i]	
		myEmotion[i]	
		myEmote[i]		
		mySpeaker[i]	
		myTextCol[i]	
		
		*/
		
		
		
state = 1;
flowercount = 0;
flowerincrement = 0;
myshadow = noone;
reset_dialogue_defaults();
