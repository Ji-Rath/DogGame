/// @description Insert description here
// You can write your code in this editor
enemyvariablereset();

//If in battle room, turn invisible
//visible = !(room == battle);

if(Health <= 0)
{
	visible = false;
}

//Only move if visible
if(room != battle)
{
	switch(state)
	{
		case estates.idle: EnemyIdle(); break;
		case estates.wander: EnemyWander(); break;
		case estates.alert: EnemyAlert(); break;
		case estates.aggro: EnemyAggro(); break;
	}
}
else 
{
	hsp = 0;
	vsp = 0;
}

//Assign attacker
if (place_meeting(x,y,oDogPaddler))
{
	oDogPaddler.Attacker = BattleObject;
}