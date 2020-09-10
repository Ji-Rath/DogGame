
draw_set_alpha(Alpha);
draw_set_color(c_white);
draw_set_font(fnt_stats);

//Draw battle timer
if((DrawTimer > 0 || BattleTimer != DrawTimer) && !instance_exists(oMiniGame) && oBattleMenuBase.AnimAlpha != 0)
{
	var TimerPosX = room_width/2;
	var TimerPosY = room_height/1.4;
	var BarHeight = 20;
	
	//draw_sprite_ext(sBattleTimer,0,TimerPosX-BarWidth/2-100,TimerPosY, 1, 1, 0, c_dkgray, 1);
	draw_roundrect_color(TimerPosX-BarWidth/2,TimerPosY+BarHeight/2,TimerPosX+BarWidth/2,TimerPosY-BarHeight/2, c_dkgray, c_dkgray, false);
	var BattleTimerNum = ((DrawTimer/60)/BattleTimerInit*BarWidth);
	draw_roundrect_color(TimerPosX-BarWidth/2,TimerPosY+BarHeight/2,TimerPosX-BarWidth/2+BattleTimerNum,TimerPosY-BarHeight/2, c_red, c_red, false);
}



//Position of player portrait on screen - including shake values
var PortraitX = 50+choose(Shake[0],-Shake[0]);
var PortraitY = 50;
	
//Draw player portrait
draw_sprite(sUIPlayer,0,PortraitX,PortraitY);
draw_sprite(sUIPlayer,1,PortraitX,PortraitY+100);
	
//If player is smelly...i mean hungry, draw effect
if(global.PlayerPP <= 0)
	draw_sprite(sEffectHungry, image_index, PortraitX+50, PortraitY+50);

//Draw neglect effect for ally
if(NeglectMeter >= MaxNeglect)
	draw_sprite(sEffectNeglect, image_index, PortraitX+50, PortraitY+100+50);
	
//Draw player status
draw_text(PortraitX+DPhpx,PortraitY+DPhpy,round(DrawPlayerHealth));
draw_text(PortraitX+DPhpx,PortraitY+DPhpy+DPoffy,round(DrawPlayerPP));

draw_set_alpha(1);

