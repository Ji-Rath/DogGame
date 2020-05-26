
if(oMiniGame.timer[0] == -1 && !Opened)
{
    repeat(20)
    {
        var Chip = instance_create_layer(x,y,"Instances",oChip);
        Chip.speed = random_range(5,25);
        Chip.direction = 90+random_range(-45,45);
        ds_list_add(oMiniGame.Instances, Chip);
    }
    Opened = true;
}

//Finish minigame if player finishes early
if(Opened && !Complete && instance_number(oChip) == 0)
{
    oMiniGame.timer[1] = 0.5*60;
    Complete = true;
}