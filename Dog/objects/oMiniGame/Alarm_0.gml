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
		with(oEnemyBattleParent)
				EnemyVisibility = new DrawEnemyInit(true, true);
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
		DrawSmall = true;
		break;
    case Game.AnvilStruggle:
        HelpText = "Struggle/Save!";
		var DogHelp = CreateInstance(room_width/2,room_height/2+200,oDogSave);
        var Anvil = CreateInstance(room_width/2,room_height/2-200,oAnvil);
		
		Anvil.DogSave = DogHelp;
		break;
	case Game.ThirstyDoggo:
		MiniGameEndSeq = seqDehydratedMinigameEnd;
		CreateInstance(room_width/2+400,room_height/2-250, oAnchorPoint);
		CreateInstance(room_width/2+300,room_height/2-250, oHand);
		CreateInstance(room_width/2,room_height/2+150, oThirstyDoggo);
		break;
	case Game.DogTan:
		CreateInstance(room_width/2, room_height/2, oDogTan);
		break;
	case Game.Lighthouse:
		MiniGameEndSeq = seqFanMinigameEnd;
		CreateInstance(room_width/2+250, room_height/2, oCampfire);
		CreateInstance(room_width/2-250, room_height/2, oFan);
		break;
	case Game.OrderingMinigame:
		CreateInstance(room_width/2, room_height/2, oCustomerPTWM);
		break;
	case Game.PingPong:
		CreateInstance(room_width/2, room_height/2, oPaddle);
		break;
	case Game.RedLightGreenLight:
		CreateInstance(room_width/2 + 200, room_height/2, oRLGLstoplight);
		CreateInstance(room_width/2 - 200, room_height/2, oRLGLrunner);
		break;
	case Game.Golf:
		CreateInstance(room_width/2, room_height/2, oGolf);
		break;
	case Game.SimonSays:
		CreateInstance(room_width/2 -200, room_height/2 + 100, oSSChefBingo);
		CreateInstance(room_width/2 + 200, room_height/2 + 100, oSSDogPaddler);
		CreateInstance(room_width/2, room_height/2 - 100, oSSInputArrow);
		break;
	case Game.CrossRoad:
		CreateInstance(room_width/2,room_height,oCTSparent);
		CreateInstance(room_width/2, room_height/2, oCTSrunner);
		CreateInstance(room_width/2 - 150, room_height/2, oCTStruck);
		CreateInstance(room_width/2 - 150, room_height/2, oCTStruck);
		CreateInstance(room_width/2 - 400, room_height/2, oCTSWall);
		CreateInstance(room_width/2 + 395, room_height/2, oCTSWall);

		break;
}

if (!DrawSmall)
	MiniGameScreenSeq = scrRunSequence(seqAttackEnter);
