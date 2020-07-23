

//Create smoke particles and count how many brushes the player did
if(mouse_x > x && CurrentPosition != 1)
{
    CurrentPosition = 1;
    Brushes++;
    var s = instance_create_layer(x, y+150, "Instances", oBroomSmoke);
    s.HSpeed = -7;
}

if(mouse_x < x && CurrentPosition != 0)
{
    CurrentPosition = 0;
    Brushes++;
    var s = instance_create_layer(x, y+150, "Instances", oBroomSmoke);
    s.HSpeed = 7;
}


//If player was successful
if(Brushes > 16 && !Success)
{
    oMiniGame.timer[1] = 1;
    oEnemyBattleParent.Vulnerable = true;
    Success = true;
    
    var Icon = instance_create_layer(room_width/2, room_height/2, "GUI", oIconPopup);
    Icon.Sprite = sCheckMark;
}