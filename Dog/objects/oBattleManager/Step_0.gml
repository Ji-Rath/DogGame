
//Increment neglect at a rate of 1 per second
if(NeglectMeter <= MaxNeglect && !instance_exists(oTextBox))
	NeglectMeter += (1/60);

// Only countdown timer when player can make a move during their turn
// Go to enemy turn if out of time
var bCanInteract = DrawGUI && oBattleMenuBase.AnimAlpha != 0 && !instance_exists(oMiniGame)
if (bCanInteract)
{
	if(BattleTimer > 0)
	{
		BattleTimer -= 1;
	}
	else
	{
		NextTurn();
		
		with(oBattleMenuBase)
		{
			scrAnimReinit(Animations.Flip, Animations.FadeOut);
			Selected = false;
		}
	}
}

if(timer[0] == -1 && !UpdateStats)
{
	if (DrawPlayerHealth != global.PlayerHP)
	{
		DrawGUI = true;
		timer[0] = 0.5*60;
	}
	
	/*
	var bCanDrawEnemyHP = (DrawTimer != BattleTimer && !instance_exists(oMiniGame));
	if(DrawEnemyHealth != EnemyBattle.Health || bCanDrawEnemyHP)
	{
		DrawGUI = true;
		timer[0] = 1;
	}
	*/
}


//Update player stats visually if changed
if(UpdateStats)
{
	var Check = 0;
	var Increment = 0.25;
	
	//Check player health for changes
	DrawPlayerHealth += Increment*sign(global.PlayerHP-DrawPlayerHealth);
	
	if(DrawPlayerHealth = global.PlayerHP)
		Check++;
	
	//Check player PP for changes
	DrawPlayerPP += Increment*sign(global.PlayerPP-DrawPlayerPP);
	
	if(DrawPlayerPP = global.PlayerPP)
		Check++;
	
	/*
	//Check enemy health for changes
	DrawEnemyHealth += Increment*sign(EnemyBattle.Health-DrawEnemyHealth);
	
	if(DrawEnemyHealth = EnemyBattle.Health)
		Check++;
	*/
	
	if(!instance_exists(oMiniGame))
	{
		//Check battle timer for changes
		DrawTimer += clamp(Increment*16, 0, abs(DrawTimer-BattleTimer))*sign(BattleTimer-DrawTimer);
	
		if(DrawTimer == BattleTimer)
			Check++;
	}
	else
		Check++;
	
	
	//If all checks done, go to next phase
	if(Check == 3 && timer[0] == -1)
		timer[0] = 0.5*60;
}

//TIMER MANAGEMENT

// Update visual effects for opponents
if(timer[0] > 0)
	timer[0] -= 1;
else if(timer[0] != -1)
{
	UpdateStats = !UpdateStats;
	timer[0] = -1;
	
	//Player UI shake when damaged
	if(DrawPlayerHealth > global.PlayerHP)
		Shake[0] = 8;
	
	/*
	//Enemy shake when damaged
	if(DrawEnemyHealth > EnemyBattle.Health)
		Shake[1] = 8;
	
	//If enemy is flipped, but them in correct position
	if(oEnemyBattleParent.Vulnerable && BattleStage == BattleSection.EnemyAttack)
		oEnemyBattleParent.Vulnerable = false;
	
	*/
}

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
