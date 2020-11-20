

//Create smoke particles and count how many brushes the player did
if(mouse_x > x && CurrentPosition != 1)
{
    CurrentPosition = 1;
    Brushes++;
    var s = oMiniGame.CreateInstance(x, y+150, oBroomSmoke, "Instances");
    s.HSpeed = -7;
}

if(mouse_x < x && CurrentPosition != 0)
{
    CurrentPosition = 0;
    Brushes++;
    var s = oMiniGame.CreateInstance(x, y+150, oBroomSmoke, "Instances");
    s.HSpeed = 7;
}


//If player was successful
if(Brushes > 16 && !Success)
{
    scrFinishMiniGame(true);
	
    oEnemyBattleParent.Vulnerable = true;
    Success = true;
}

image_index = CurrentPosition;