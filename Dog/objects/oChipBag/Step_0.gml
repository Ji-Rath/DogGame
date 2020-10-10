


//Finish minigame if player finishes early
if(Opened && !Complete && instance_number(oChip) == 0)
{
	scrMiniGameIcon(sMoreTime);
    scrFinishMiniGame(true);
    Complete = true;
    
    oBattleManager.BattleTimer += 2*60;
}