
if (path_speed != 0 && round(PathPos*100) == round(path_position * 100))
{
	path_position = PathPos;
	path_speed = 0;
}

if (keyboard_check_pressed(ord("F")))
{
	ShiftEnemies();
}

//Delay death animation
if(Health <= 0 && timer[0] == -1 && oBattleManager.BattleStage == BattleSection.PlayerVictory && !IsDead && path_index == -1)
{
    timer[0] = 1*60;
}

if(!Angry && Health < MaxHealth/2)
{
	with(oBattleManager)
	{
		SpeedMultiplier += 0.7;
		BattleTimerInit = 20/SpeedMultiplier; //Time for player turn (seconds)	
	}
	// CreateBattleTextEvent("Im Angry Now!", false, new TextInit(0.05, c_black, 1));
	Angry = true;
}

//Perform enemy death animation
if(timer[0] > 0)
{
    timer[0] -= 1;
}
else if(timer[0] != -1)
{
    path_start(pathEnemyDeath, 20, path_action_stop, false);
    timer[0] = -1;
}

//Show victory message
if(path_index == pathEnemyTurn && path_position == 1)
{
	if(!instance_exists(oTextBox))
	{
		if(!IsDead)
		{
			// CreateBattleTextEvent("You Win!");
			IsDead = true;
		}
		else
		{
			with(oBattleManager)
			{
				BattleStage = BattleSection.RoomTransition;
				RunBattleStage();
			}
		}
	}
}

//Spin enemy while death animation is running
if(path_index == pathEnemyDeath)
{
    Angle += 20;
}

//If enemy is vulnerable, rotate enemy
if(Vulnerable)
{
    if(Angle != 180 && Health > 0)
        Angle += 5;
}
else
{
    if(Angle != 0 && Health > 0)
        Angle -= 15;
}

//Minigame intro transition and outro effect
if(instance_exists(oMiniGame))
{
    if(OpenFraction <= (pi/2))
        OpenFraction += (oBattleManager.SpeedMultiplier/2)/(2*pi);
}
else
{
    if(OpenEffect >= 0)
    {
        OpenFraction -= (oBattleManager.SpeedMultiplier/2)/(2*pi);
    }
	else
	{
		EnemyVisibility = new DrawEnemyInit(false, false);
	}
}

if (DrawEnemyHealth != Health)
	DrawEnemyHealth = clamp(Health+(0.05*sign(Health - DrawEnemyHealth)), 0, MaxHealth);
OpenEffect = sin(OpenFraction);