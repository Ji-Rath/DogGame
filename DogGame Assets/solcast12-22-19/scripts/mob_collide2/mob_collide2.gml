with (oPlayer)
		{
			
			
			
			if (place_meeting(x+hsp,y+vsp,other)) and (oPlayer.iframestate != iframes.active)
			{
				image_xscale = scale*-sign(other.image_xscale);
				state = states.Playerknockbackempty;
				if (state = states.PlayerGlide)
				{
					oYam.macrostate1 = party1macrostates.followplayer;
					oYam.state = party1states.reposition;
					
					dog.state = follow2;
					
					
				}
		
				
				
				kbhsp = (sign(other.image_xscale)*(other.strength*knockbackstrength))
			}
		}