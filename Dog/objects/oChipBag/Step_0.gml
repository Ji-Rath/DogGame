
if(oMiniGame.timer[0] == -1 && !Opened)
{
    repeat(15)
    {
        var Chip = instance_create_layer(x,y,"Instances",oChip);
        Chip.speed = random_range(10,30);
        Chip.direction = 90+random_range(-55,55);
        ds_list_add(oMiniGame.Instances, Chip);
    }
    Opened = true;
}

//Finish minigame if player finishes early
if(Opened && !Complete && instance_number(oChip) == 0)
{
    oMiniGame.timer[1] = 0.5*60;
    Complete = true;
    
    oBattleManager.BattleTimer += 2*60;
    
    var Icon = instance_create_layer(room_width/2, room_height/2, "GUI", oIconPopup);
    Icon.Sprite = sMoreTime;
}