
if(Health <= 0 && timer[0] == -1 && oBattleManager.BattleStage >= 6 && !IsDead && path_index == -1)
{
    timer[0] = 1*60;
}

if(timer[0] > 0)
{
    timer[0] -= 1;
}
else if(timer[0] != -1)
{
    path_start(pathBattleEnemyDeath, 20, path_action_stop, false);
    timer[0] = -1;
}

if(path_position == 1 && !IsDead)
{
    scrCreateBattleBox(["You Win!"]);
    IsDead = true;
}

if(path_index != -1)
{
    Angle += 20;
}