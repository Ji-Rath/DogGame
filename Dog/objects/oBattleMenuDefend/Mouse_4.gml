/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (CanPress())
{
	// Allow player to block up to 3 attacks
	with (oBattleMissileBoy)
	{
		if (oBattlePlayer.BlockableAttacks > 0)
		{
			Blocks = clamp(Blocks+oBattlePlayer.BlockableAttacks,0,MaxBlocks);
			oBattlePlayer.BlockableAttacks = 0;
		}
		else if (Blocks > 0)
		{
			oBattlePlayer.BlockableAttacks = Blocks;
			Blocks = 0;
		}
	}
}

