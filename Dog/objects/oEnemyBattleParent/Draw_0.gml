
//Shake enemy if damaged
var XPos = x + choose(oBattleManager.Shake[1],-oBattleManager.Shake[1]);
var YPos = y;
var Alpha = 1;
var Scale = 1;
var YDivision = 1;

if(instance_exists(oMiniGame))
{
    if(oMiniGame.ShowEnemy)
    {
        Scale = 1-(oMiniGame.OpenEffect/1.75);
    }
    else
    {
        YPos = y + oMiniGame.OpenEffect*250;
        Alpha = 1-(oMiniGame.OpenEffect/2);
    }
    
    if(instance_exists(oPan))
    {
        if(oPan.Hit)
        {
            YDivision = 2;
        }
    }
}

draw_sprite_ext(sprite_index,image_index,XPos,YPos,Scale,Scale/YDivision,Angle,c_white,Alpha);

var HC = HealthChanged;

with(oBattleManager)
{
    if (EnemyBattle != noone && DrawEnemyHealth != EnemyBattle.Health)
    {
        HC = true;
    }
    if(!UpdateStats)
    {
        HC = false;
    }
}

HealthChanged = HC;

if((oBattleManager.visible) && HealthChanged)
    draw_healthbar(XPos-100,YPos-50,XPos+100,YPos-75,oBattleManager.DrawEnemyHealth*10,c_gray,c_red,c_red,0,true,false);