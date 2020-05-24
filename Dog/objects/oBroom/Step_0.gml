

//Create smoke particles and count how many brushes the player did
if(mouse_x > x && CurrentPosition != 1)
{
    CurrentPosition = 1;
    Brushes++;
}

if(mouse_x < x && CurrentPosition != 0)
{
    CurrentPosition = 0;
    Brushes++;
}


//If player was successful
if(Brushes > 16 && !oEnemyBattleParent.Vulnerable)
{
    oMiniGame.timer[1] = 1;
    oEnemyBattleParent.Vulnerable = true;
}