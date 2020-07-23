
//Draw battle timer
if((DrawTimer > 0 && BattleStage == 3) || BattleTimer != DrawTimer)
{
	var TimerPosX = room_width/2;
	var TimerPosY = room_height/1.3;
	var BarHeight = 20;
	
	draw_sprite(sBattleTimer,0,TimerPosX-BarWidth/2-100,TimerPosY);
	draw_set_color(c_black);
	draw_rectangle(TimerPosX-BarWidth/2,TimerPosY+BarHeight/2,TimerPosX+BarWidth/2,TimerPosY-BarHeight/2,false);
	draw_set_color(c_red);
	var BattleTimerNum = ((round(DrawTimer/60/BattleTimerInit*16)/16)*BarWidth);
	draw_rectangle(TimerPosX-BarWidth/2,TimerPosY+BarHeight/2,TimerPosX-BarWidth/2+BattleTimerNum,TimerPosY-BarHeight/2,false);
}

