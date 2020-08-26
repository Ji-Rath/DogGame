
//Switch to the specified minigame
switch(GameType)
{
    case Game.CrabAttack:
        ds_list_add(Instances, instance_create_layer(room_width/4,room_height/2,"Instances",oPlayerBoob));
        ds_list_add(Instances, instance_create_layer(room_width/1.5,room_height/2,"Instances",oEnemyCrabArm));
    break;
    
    case Game.Crab1:
        HelpText = "Dodge!";
        ds_list_add(Instances, instance_create_layer(room_width/2,room_height/2+50,"Instances",oCrab1Arm));
        ds_list_add(Instances, instance_create_layer(room_width/2,room_height/2-50,"Instances",oCrab1Player));
    break;
    
    case Game.GlovesOff:
        ds_list_add(Instances, instance_create_layer(room_width/2,room_height/2,"Instances",oPlayerGloveSmack));
    break;
    
    case Game.Chips:
        ds_list_add(Instances, instance_create_layer(room_width/2,room_height/2+200,"Instances",oChipBag));
    break;
    
    case Game.PanAttack:
        ds_list_add(Instances, instance_create_layer(room_width/2+300,room_height/2,"Instances",oPan));
    break;
    
    case Game.BroomAttack:
        HelpText = "Broom!";
        ds_list_add(Instances, instance_create_layer(room_width/2,room_height/2,"Instances",oBroom));
    break;
    
    case Game.CrabWeigh:
        HelpText = "Weigh!";
        ds_list_add(Instances, instance_create_layer(room_width/2+200+random(200),room_height/2+random_range(-150,150),"Instances",oCrabWeigh));
        ds_list_add(Instances, instance_create_layer(room_width/2-200+random(200),room_height/2+random_range(-150,150),"Instances",oCrabWeigh));
        ds_list_add(Instances, instance_create_layer(room_width/2,room_height/2+100,"Instances",oCrabBalance));
    break;
    
    case Game.Highfive:
        DrawSmall = true;
        SmallScreenPosX = 250+100;
        SmallScreenPosY = 125+100;
        ds_list_add(Instances, instance_create_layer(SmallScreenPosX,SmallScreenPosY,"Instances",oHighfive));
    break;
    
    case Game.AnvilStruggle:
        HelpText = "Struggle!";
        var Anvil = instance_create_layer(room_width/2,room_height/2-200,"Instances",oAnvil);
        ds_list_add(Instances, Anvil);
        var Collision = instance_create_layer(room_width/2-32, room_height/2+200-32, "Instances", oPhysicsBox);
        ds_list_add(Instances, Collision);
        Anvil.MouseCollision = Collision;
    break;
}
