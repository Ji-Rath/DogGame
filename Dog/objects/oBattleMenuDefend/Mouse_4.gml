/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (CanPress())
{
	// Allow player to block up to 3 attacks
	with (oBattleMissileBoy)
	{
		if (Blocks > 0)
		{
			bIsBlocking = !bIsBlocking;
			TweenFinish(ShieldToPlayer, false);
			TweenFinish(ShieldReturn, false);
			if (!bIsBlocking)
			{
				TweenPlay(ShieldReturn);
			}
			else
			{
				TweenPlay(ShieldToPlayer);
			}
		}
	}
}

