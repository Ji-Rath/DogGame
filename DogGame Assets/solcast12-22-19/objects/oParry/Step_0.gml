/// @description Insert description here
// You can write your code in this editor
x = follow.x;
y = follow.y;


#region base
if (place_meeting(x,y,oMob))
{
	mobcollision = 1;
	
	
}else 
{
	mobcollision = 0;
	
}






#endregion




if (state == parrystates.inactive)

{
	#region
	timercount = 0;
	recoverycount = 0;
	
	
	
	#endregion
	
}
else if (state == parrystates.active)

{
	
	#region

	
	timercount += 1;
	
	if (timercount > 12)
	{
		state = parrystates.recovery;
		
	}
	
	
	
	#endregion
	
	
	
	
}

else if (state == parrystates.recovery)

{
	
	#region

	
	recoverycount += 1;
	
	if (recoverycount > 3)
	{
		state = parrystates.inactive;
		
	}
	
	
	
	#endregion
	
	
	
	
}
