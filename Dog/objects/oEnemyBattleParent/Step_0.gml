
if(Health <= 0 && timer[0] == -1 && oBattleManager.BattleStage >= 6 && !IsDead && path_index == -1)
{
    timer[0] = 1*60;
}

if(timer[0] > 0)
{
    timer[0] -= 1;
    effect_create_below(ef_ring, x+random_range(-15,15),y+random_range(-15,15),random(5),c_red);
}
else if(timer[0] != -1)
{
    path_start(pathBattleEnemyDeath, 10, path_action_stop, false);
    timer[0] = -1;
}

if(path_position == 1 && !IsDead)
{
    scrCreateBattleBox(["You Win!"]);
    IsDead = true;
}

if(path_index != -1)
{
    Angle += 15;
}