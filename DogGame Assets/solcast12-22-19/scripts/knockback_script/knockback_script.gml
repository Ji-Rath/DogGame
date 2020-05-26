

with (follow)
		{
			
			
			
			if (place_meeting(x+hsp,y+vsp,other)) and (oPlayer.iframestate != iframes.active) and (game.juststarted == true) and (oPlayer.state != states.chest)
			{
				
				state = states.Playerknockbackempty;
				
				
				kbhsp = -(sign(image_xscale)*knockbackstrength)
				
				
				
			}
			else if (place_meeting(x+hsp,y+vsp,other)) and (oPlayer.iframestate != iframes.active) and (oPlayer.state != states.chest)
			{
				
				state = states.PlayerKnockback;
				if (state = states.PlayerGlide)
				{
					oYam.macrostate1 = party1macrostates.followplayer;
					oYam.state = party1states.reposition;
					
					dog.state = follow2;
					
					
				}
				
				kbhsp = -(sign(image_xscale)*knockbackstrength)
				
				
				
			}
			
			
		}
		