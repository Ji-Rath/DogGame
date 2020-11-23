
//Shake enemy if damaged
var XPos = x + choose(oBattleManager.Shake[1],-oBattleManager.Shake[1]);
var YPos = y;
var Dist = abs(0.5 - path_position) + 0.5;
var Alpha = 1*Dist;
var Scale = 1*Dist;
var YDivision = 1;

//Draw enemy if the minigame has the option enabled
if(instance_exists(oMiniGame))
{
    if(instance_exists(oPan))
    {
        if(oPan.Hit)
        {
            YDivision = 2;
        }
    }
}
if(EnemyVisibility.DrawSmall && oBattleManager.GetFocusedEnemy() == self)
{
	Scale = 1-(OpenEffect/1.75);
}
else
{
	YPos = y + OpenEffect*250;
	Alpha -= OpenEffect;
}

draw_set_alpha(Alpha);

//Draw enemy sprite at specified dimensions
draw_sprite_ext(sprite_index,image_index,XPos,YPos,Scale,Scale/YDivision,Angle,c_white,Alpha);

//Draw enemy health if it has changed
if(DrawEnemyHealth != Health)
{
	draw_healthbar(XPos-100,YPos-50,XPos+100,YPos-75,(round(DrawEnemyHealth)/MaxHealth)*100,c_gray,c_red,c_red,0,true,false);
}
//draw_path(pathEnemyTurn, 0,0, true);
draw_set_alpha(1);
    
