///@description Spawn MiniGame objects
//Switch to the specified minigame
switch(GameType)
{
    case Game.CrabAttack: //Deprecated mini game
        CreateInstance(room_width/4,room_height/2,oPlayerBoob);
        CreateInstance(room_width/1.5,room_height/2,oEnemyCrabArm);
		break;
    case Game.Crab1: //Crab pinch minigame
        HelpText = "Dodge!";
        CreateInstance(room_width/2,room_height/2+50,oCrab1Arm);
        CreateInstance(room_width/2,room_height/2-50,oCrab1Player);
		break;
    case Game.GlovesOff:
        CreateInstance(room_width/2,room_height/2,oPlayerGloveSmack);
		break;
    case Game.Chips:
        CreateInstance(room_width/2,room_height/2+200,oChipBag);
		break;
    case Game.PanAttack:
		with(oEnemyBattleParent)
			EnemyVisibility = new DrawEnemyInit(true, true);
        CreateInstance(room_width/2+300,room_height/2,oPan);
		break;
    case Game.BroomAttack:
        HelpText = "Broom!";
        CreateInstance(room_width/2,room_height/2,oBroom);
		break;    
    case Game.CrabWeigh:
        HelpText = "Weigh!";
        CreateInstance(room_width/2+200+random(200),room_height/2+random_range(-150,150),oCrabWeigh);
        CreateInstance(room_width/2-200+random(200),room_height/2+random_range(-150,150),oCrabWeigh);
        CreateInstance(room_width/2,room_height/2+100,oCrabBalance);		
		break;
    case Game.Highfive:
		with(oEnemyBattleParent)
			EnemyVisibility = new DrawEnemyInit(true, false);
        SmallScreenPosX = 250+50;
        SmallScreenPosY = 125+50;
        CreateInstance(SmallScreenPosX,SmallScreenPosY,oHighfive);
		break;
    case Game.AnvilStruggle:
        HelpText = "Struggle/Save!";
		var DogHelp = CreateInstance(room_width/2,room_height/2+200,oDogSave);
        var Anvil = CreateInstance(room_width/2,room_height/2-200,oAnvil);
		
		Anvil.DogSave = DogHelp;
		break;
	case Game.ThirstyDoggo:
		CreateInstance(room_width/2+400,room_height/2-250, oAnchorPoint);
		CreateInstance(room_width/2+300,room_height/2-250, oHand);
		CreateInstance(room_width/2,room_height/2+150, oThirstyDoggo);
		break;
	case Game.DogTan:
		CreateInstance(room_width/2, room_height/2, oDogTan);
		break;
	case Game.Lighthouse:
		CreateInstance(room_width/2+250, room_height/2, oCampfire);
		CreateInstance(room_width/2-250, room_height/2, oFan);
		break;
}
