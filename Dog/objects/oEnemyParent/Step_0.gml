/// @description Insert description here
// You can write your code in this editor
enemyvariablereset();

//If in battle room or dead, turn invisible
visible = !((room == battle) || (Health <= 0));

//Only move if visible
if(visible)
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