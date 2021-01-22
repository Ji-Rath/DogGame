/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

instance_create_layer(0, 0, "GUI", oBattleMenuDefend);

Blocks = 3;
MaxBlocks = 3;
ShieldYPos = y;
bIsBlocking = false;

ShieldToPlayer = TweenCreate("$0.5", "ShieldYPos>", "oBattlePlayer.y");
ShieldReturn = TweenCreate("$0.5", "ShieldYPos>", "y");

alarm[0] = 1;

function CanBlockAttack()
{
	return bIsBlocking && Blocks > 0;	
}
