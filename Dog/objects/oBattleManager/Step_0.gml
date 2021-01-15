
// Only countdown timer when player can make a move during their turn
// Go to enemy turn if out of time
var bCanInteract = DrawGUI && !instance_exists(oMiniGame)
if (bCanInteract)
{
	if(BattleTimer > 0)
	{
		BattleTimer --;
	}
	else if (BattleTimer != -1)
	{
		NextTurn();
		BattleTimer = -1;
		with(oBattleMenuBase)
		{
			TweenPlay(FadeOut);
			Selected = false;
		}
		
		with(oBattleCharBase)
				TweenPlay(FadeOut);
	}
}

// Update Drawn Timer value
var bCanDrawTimer = DrawTimer != BattleTimer && (DrawTimer != BattleTimer && !instance_exists(oMiniGame));
if (bCanDrawTimer)
{
	var Increment = 0.25;
	DrawTimer += clamp(Increment*16, 0, abs(DrawTimer-BattleTimer))*sign(BattleTimer-DrawTimer);
}

//Player UI shake when damaged
//if(DrawPlayerHealth > global.PlayerHP)
//	Shake[0] = 8;

//Shake effect
for(i=0;i<array_length_1d(Shake);i++)
{
	if(Shake[i] > 0)
		Shake[i] /= 1.075;
}

//Manage alpha fading for UI
if (Alpha <= 1 && Alpha >= 0)
{
	var Val = 0.06*SpeedMultiplier;
	Alpha += DrawGUI ? Val : -Val;
	Alpha = clamp(Alpha, 0, 1);
}
