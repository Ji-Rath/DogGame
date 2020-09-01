
//Delay death animation
if(Health <= 0 && timer[0] == -1 && oBattleManager.BattleStage >= 6 && !IsDead && path_index == -1)
{
    timer[0] = 1*60;
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
if(path_position == 1 && !IsDead)
{
    CreateBattleTextEvent("You Win!", true);
    IsDead = true;
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