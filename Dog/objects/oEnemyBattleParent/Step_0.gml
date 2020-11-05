
//Delay death animation
if(Health <= 0 && timer[0] == -1 && oBattleManager.BattleStage == BattleSection.PlayerVictory && !IsDead && path_index == -1)
{
    timer[0] = 1*60;
}

if(oBattleManager.DrawEnemyHealth < MaxHealth/2 && !Angry)
{
	with(oBattleManager)
	{
		SpeedMultiplier += 0.7;
		BattleTimerInit = 20/SpeedMultiplier; //Time for player turn (seconds)	
	}
	CreateBattleTextEvent("Im Angry Now!", false, new TextInit(0.05, c_black, 1));
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
if(path_position == 1)
{
	if(!instance_exists(oTextBox))
	{
		if(!IsDead)
		{
			CreateBattleTextEvent("You Win!");
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
if(path_index != -1)
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

OpenEffect = sin(OpenFraction);