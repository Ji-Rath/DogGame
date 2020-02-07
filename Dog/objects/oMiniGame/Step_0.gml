
//After set time, execute game
if(timer[0] > 0)
{
    timer[0] -= 1;
}
else if (timer[0] != -1)
{
    ds_list_add(Instances, instance_create_layer(room_width/4,room_height/2,"Instances",oPlayerBoob));
    ds_list_add(Instances, instance_create_layer(room_width/1.5,room_height/2,"Instances",oEnemyCrabArm));
    timer[0] = -1;
    timer[1] = 4*60;
}

//End of minigame
if(timer[1] > 0)
{
    timer[1] -= 1;
}
else if (timer[1] != -1)
{
    for(var i=0;i<ds_list_size(Instances);i++)
    {
        instance_destroy(ds_list_find_value(Instances,i));
    }
    instance_destroy();
    oBattleManager.BattleStageEnd = true;
}