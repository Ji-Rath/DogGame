with (oPlayer)
{
			
			
			
	if (place_meeting(x+hsp,y+vsp,oMob)) 
	{
		image_xscale = scale*-sign(other.image_xscale);
		state = states.PlayerKnockback;
		if (state = states.PlayerGlide)
		{
			oYam.macrostate1 = party1macrostates.followplayer;
			oYam.state = party1states.reposition;
					
			dog.state = follow2;
					
					
		}
		if (other.mobknockbackcount < 2)
		{
			kbhsp = (sign(other.image_xscale)*knockbackstrength)
				
				
		}
	}
}