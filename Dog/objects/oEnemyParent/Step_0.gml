/// @description Insert description here
// You can write your code in this editor
scrMoveCollision();

//If in battle room or dead, turn invisible
visible = !((room == battle) || (Health <= 0));

//Only move if visible
if(visible)
{
	switch(state)
	{
		case estates.idle: scrEnemyIdle(); break;
		case estates.wander: scrEnemyWander(); break;
		case estates.alert: scrEnemyAlert(); break;
		case estates.aggro: scrEnemyAggro(); break;
	}
}
else 
{
	hsp = 0;
	vsp = 0;
}