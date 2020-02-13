/// @description Insert description here
// You can write your code in this editor

if(BattleStage == 2)
{
	var GUIWidth = display_get_gui_width();
	var GUIHeight = display_get_gui_height();
	
	//Set color/font
	draw_set_color(c_white);
	draw_set_font(fnt_stats);
	
	//Draw player portrait
	draw_sprite(sGUIPlayerInfo,0,50,50);
	
	//Draw player status
	draw_text(50+DPhpx,50+DPhpy,global.phealth);
	draw_text(50+DPhpx,50+DPhpy+DPoffy,global.pp);
	
	//Draw battle timer
	var TimerPosX = GUIWidth/2;
	var TimerPosY = GUIHeight/1.25;
	var BarHeight = 20;
	
	draw_sprite(sBattleTimer,0,TimerPosX-BarWidth/2-100,TimerPosY);
	draw_set_color(c_black);
	draw_rectangle(TimerPosX-BarWidth/2,TimerPosY+BarHeight/2,TimerPosX+BarWidth/2,TimerPosY-BarHeight/2,false);
	draw_set_color(c_red);
	var BattleTimerNum = ((BattleTimer/60/BattleTimerInit)*BarWidth);
	draw_rectangle(TimerPosX-BarWidth/2,TimerPosY+BarHeight/2,TimerPosX-BarWidth/2+BattleTimerNum,TimerPosY-BarHeight/2,false);
}

