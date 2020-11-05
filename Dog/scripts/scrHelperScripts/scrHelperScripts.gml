// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scrRunMiniGame(GameType) {
	var MiniGame = instance_create_layer(0,0,"GameManager",oMiniGame);
	MiniGame.GameType = GameType;
}

function scrFinishMiniGame(bIsSuccess)
{
	if(bIsSuccess)
	{
		with(oMiniGame)
		{
			if(MiniGameEndSeq != -1)
			{
				var Seq = scrRunSequence(MiniGameEndSeq);
				var Len = layer_sequence_get_length(Seq);
				var Spd = layer_sequence_get_speedscale(Seq);
				timer[1] = Len*Spd;
			}
			else
				timer[1] = 0.5*60;
			
		    scrMiniGameIcon(sCheckMark);
		}
	}
	else
		oMiniGame.timer[1] = 0.5*60;
}