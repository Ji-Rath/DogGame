/// @description Insert description here
// You can write your code in this editor
if (keyboard_check_pressed(interact_key))
{
	
	if (page < array_length_1d(text)-1)
	{
		page ++;//event_perform(ev_other,ev_user1);
		counter = 0;
		
	}
	else
	{
		//When there is no more text, move on to the next battle stage
		
		//1 - ENEMY ATTACK
		//2 - PLAYER ATTACK
		//3 - TEXT CHATTER, END
		
		oBattleManager.BattleStageEnd = true;
		instance_destroy();
	}
	
	
}