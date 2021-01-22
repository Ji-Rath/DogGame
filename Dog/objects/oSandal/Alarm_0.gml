/// @description Insert description here
// You can write your code in this editor

with (oEnemyBattleParent)
{
	if (path_index == pathEnemyTurn)
	{
		if (PathPos == 0)
			Health -= 5;	
	}
	if (path_index == pathEnemyLine)
	{
		if (PathPos == 0)
		{
			Health -= 5;	
		}
		else
		{
			Health -= 2;	
		}
	}
}

layer_sequence_destroy(SandalSequence);