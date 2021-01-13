// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scrRunMiniGame(GameType) {
	var MiniGame = instance_create_layer(0,0,"GameManager",oMiniGame);
	MiniGame.GameType = GameType;
}

function scrFinishMiniGame(bIsSuccess)
{
	if (instance_exists(oMiniGame) && !oMiniGame.bCompletedGame)
	{
		if(bIsSuccess && oMiniGame.CanCompleteGame())
		{
			with(oMiniGame)
			{
				var bEndSequenceExists = MiniGameEndSeq != -1;
				if(bEndSequenceExists)
				{
					var Seq = scrRunSequence(MiniGameEndSeq, "TextBox");
					var Len = layer_sequence_get_length(Seq);
					var Spd = layer_sequence_get_speedscale(Seq);
					MiniGameEndSeq = Seq;
					timer[1] = ((Len*Spd)/30)*60; //Basically double time because of 60fps
					Destroy = true;
				}
				else
				{
					timer[1] = 0.5*60;
				}
			    scrMiniGameIcon(sCheckMark);
			}
		}
		else
		{
			oMiniGame.timer[1] = 0.5*60;
		}
		oMiniGame.bCompletedGame = true;
	}
}