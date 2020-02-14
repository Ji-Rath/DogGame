
//Shake enemy if damaged
var XPos = x + choose(oBattleManager.Shake[1],-oBattleManager.Shake[1]);
draw_sprite(sprite_index,image_index,XPos,y);

draw_healthbar(XPos-100,y-50,XPos+100,y-75,oBattleManager.DrawEnemyHealth*10,c_gray,c_red,c_red,0,true,false);