
//Switch to the specified minigame
switch(GameType)
{
    case Game.CrabAttack:
        ds_list_add(Instances, instance_create_layer(room_width/4,room_height/2,"Instances",oPlayerBoob));
        ds_list_add(Instances, instance_create_layer(room_width/1.5,room_height/2,"Instances",oEnemyCrabArm));
    break;
    
    case Game.Crab1:
        ds_list_add(Instances, instance_create_layer(room_width/2,room_height/2+50,"Instances",oCrab1Arm));
        ds_list_add(Instances, instance_create_layer(room_width/2,room_height/2-50,"Instances",oCrab1Player));
    break;
    
    case Game.GlovesOff:
        ds_list_add(Instances, instance_create_layer(room_width/2,room_height/2,"Instances",oPlayerGloveSmack));
    break;
}
