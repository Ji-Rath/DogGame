
//Shake enemy if damaged
var XPos = x + choose(oBattleManager.Shake[1],-oBattleManager.Shake[1]);
var YPos = y;
var Alpha = 1;
var Scale = 1;

if(instance_exists(oMiniGame))
{
    switch(oMiniGame.GameType)
    {
        case Game.GlovesOff:
            Scale = 1-(oMiniGame.OpenEffect/1.5);
        break;
        
        default:
            YPos = y + oMiniGame.OpenEffect*250;
            Alpha = 1-(oMiniGame.OpenEffect/2);
        break;
    }
}

draw_sprite_ext(sprite_index,image_index,XPos,YPos,Scale,Scale,0,c_white,Alpha);



var HealthChanged = false;
with(oBattleManager)
{
    if (EnemyBattle != noone && DrawEnemyHealth != EnemyBattle.Health)
    {
        HealthChanged = true;
    }
}
if((oBattleManager.visible) && HealthChanged)
draw_healthbar(XPos-100,YPos-50,XPos+100,YPos-75,oBattleManager.DrawEnemyHealth*10,c_gray,c_red,c_red,0,true,false);