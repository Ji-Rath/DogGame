
if (path_index == pathEnemyTurn && path_speed != 0 && round(PathPos*100) == round(path_position * 100))
{
	path_position = PathPos;
	path_speed = 0;
}

//Delay death animation
if(Health <= 0 && timer[0] == -1 && !IsDead && path_index != pathEnemyDeath)
{
    timer[0] = 1*60;
}

if(!Angry && Health < MaxHealth/2)
{
	with(oBattleManager)
	{
		SpeedMultiplier += 0.7;
		BattleTimerInit = 20/SpeedMultiplier; //Time for player turn (seconds)
		AddEnemy(oCrab, 2);
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
	if (!IsDead)
	{
		path_start(pathEnemyDeath, 20, path_action_stop, false);
		oBattleManager.DeleteEnemy(id);
	    timer[0] = -1;
		IsDead = true;
	}
    
}

//Show victory message
if(path_index == pathEnemyDeath && path_position >= 0.9)
{
	// CreateBattleTextEvent("You Win!");
	IsDead = true;
	instance_destroy();
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

var bHealthChanged = (round(DrawEnemyHealth) != Health && !HealthChanged);
var bHealthEqual = (round(DrawEnemyHealth) == Health && HealthChanged);
if (bHealthChanged && alarm[0] = -1)
	alarm[0] = 1;
if (bHealthEqual && alarm[0] = -1)
	alarm[0] = 0.5*60;

if (HealthChanged)
	DrawEnemyHealth = clamp(DrawEnemyHealth+(0.1*sign(Health - DrawEnemyHealth)), 0, MaxHealth);

OpenEffect = sin(OpenFraction);