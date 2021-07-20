
if (path_index != pathEnemyDeath && path_speed != 0 && ceil(PathPos*10) == ceil(path_position*10))
{
	path_position = PathPos;
	path_speed = 0;
}

//Delay death animation
if(Health <= 0 && timer[0] == -1 && !IsDead && path_index != pathEnemyDeath && !instance_exists(oMiniGame))
{
    timer[0] = 0.1*60;
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

var bHealthChanged = (DrawEnemyHealth != Health && !HealthChanged);
var bHealthEqual = (DrawEnemyHealth == Health && HealthChanged);
if (bHealthChanged && alarm[0] = -1)
{
	alarm[0] = 1;
	//Enemy shake when damaged
	if(DrawEnemyHealth > Health)
		oBattleManager.Shake[1] = 8;
}
if (bHealthEqual && alarm[0] = -1)
{
	//If enemy is flipped, but them in correct position
	if(Vulnerable)
		Vulnerable = false;	
	alarm[0] = 0.5*60;
}
if (HealthChanged)
{
	if (!TweenIsActive(HealthTween))
	{
		HealthTween = TweenFire("$1", "HealthLerp", 0, 1);
	}
	DrawEnemyHealth = lerp(DrawEnemyHealth, Health, HealthLerp);
	//DrawEnemyHealth = clamp(DrawEnemyHealth+(0.1*sign(Health - DrawEnemyHealth)), 0, MaxHealth);
}

OpenEffect = sin(OpenFraction);