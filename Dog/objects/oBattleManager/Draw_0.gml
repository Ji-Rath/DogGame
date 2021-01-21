
draw_set_alpha(Alpha);

//Draw battle timer
if((DrawTimer > 0 || BattleTimer != DrawTimer) && !instance_exists(oMiniGame))
{
	var TimerPosX = room_width/2;
	var TimerPosY = room_height/1.4;
	var BarHeight = 20;
	
	//draw_sprite_ext(sBattleTimer,0,TimerPosX-BarWidth/2-100,TimerPosY, 1, 1, 0, c_dkgray, 1);
	draw_roundrect_color(TimerPosX-BarWidth/2,TimerPosY+BarHeight/2,TimerPosX+BarWidth/2,TimerPosY-BarHeight/2, c_dkgray, c_dkgray, false);
	var BattleTimerNum = ((DrawTimer/60)/BattleTimerInit*BarWidth);
	draw_roundrect_color(TimerPosX-BarWidth/2,TimerPosY+BarHeight/2,TimerPosX-BarWidth/2+BattleTimerNum,TimerPosY-BarHeight/2, c_red, c_red, false);
}

draw_set_alpha(1);

