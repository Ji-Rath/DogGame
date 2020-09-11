


//Finish minigame if player finishes early
if(Opened && !Complete && instance_number(oChip) == 0)
{
    oMiniGame.timer[1] = 0.5*60;
    Complete = true;
    
    oBattleManager.BattleTimer += 2*60;
    
    scrMiniGameIcon(sMoreTime);
}