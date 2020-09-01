/// @description Insert description here


if (global.KeyInteract)
{
	//If there is additional text, from the same text array index, go to the next page
	if (Page < (array_length_1d(Text)-1))
	{
		Page ++;
		Counter = 0;
	}
	else
	{
		//If there is another text queued, read that text and display it
		if(!ds_queue_empty(TextQueue))
		{
			Text = ds_queue_dequeue(TextQueue);
			Page = 0;
		}
		else
		{
			//When there is no more text, move on to the next battle stage
			if(room = rmBattle)
			{
				oBattleManager.BattleStageEnd = EndTurn;
				if(!EndTurn)
				{
					oBattleManager.timer[0] = 0.5*60;
				}
			}
			
			instance_destroy();
		}
	}
}