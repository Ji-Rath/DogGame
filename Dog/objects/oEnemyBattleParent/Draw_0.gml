
//Shake enemy if damaged
var XPos = x + choose(oBattleManager.Shake[1],-oBattleManager.Shake[1]);
var YPos = y;
var Alpha = 1;
var Scale = 1;
var YDivision = 1;

//Draw enemy if the minigame has the option enabled
if(instance_exists(oMiniGame))
{
    if(!oMiniGame.DrawSmall)
    {
        if(oMiniGame.ShowEnemy)
        {
            Scale = 1-(oMiniGame.OpenEffect/1.75);
        }
        else
        {
            YPos = y + oMiniGame.OpenEffect*250;
            Alpha = 1-(oMiniGame.OpenEffect);
        }
    }
    
    if(instance_exists(oPan))
    {
        if(oPan.Hit)
        {
            YDivision = 2;
        }
    }
}

//Draw enemy sprite at specified dimensions
draw_sprite_ext(sprite_index,image_index,XPos,YPos,Scale,Scale/YDivision,Angle,c_white,Alpha);

//Update enemy health on screen if it has changed
var HC = HealthChanged;
with(oBattleManager)
{
    if (instance_exists(EnemyBattle) && DrawEnemyHealth != EnemyBattle.Health)
    {
        HC = true;
    }
	if(!UpdateStats)
		HC = false;
}
HealthChanged = HC;

//Draw enemy health if it has changed
if(HealthChanged)
    draw_healthbar(XPos-100,YPos-50,XPos+100,YPos-75,(oBattleManager.DrawEnemyHealth/MaxHealth)*100,c_gray,c_red,c_red,0,true,false);
    
