/// @description Insert description here
// You can write your code in this editor
if (global.KeyInteract)
{
	if (Page < (array_length_1d(Text)-1))
	{
		Page ++;
		Counter = 0;
	}
	else
	{
		if(!ds_queue_empty(TextQueue))
		{
			Text = ds_queue_dequeue(TextQueue);
			Page = 0;
		}
		else
		{
			//When there is no more text, move on to the next battle stage
			oBattleManager.BattleStageEnd = true;
			instance_destroy();
		}
	}
}