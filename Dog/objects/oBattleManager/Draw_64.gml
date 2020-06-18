/// @description Insert description here
// You can write your code in this editor

if(visible)
{
	var GUIWidth = display_get_gui_width();
	var GUIHeight = display_get_gui_height();
	
	var PortraitX = 50+choose(Shake[0],-Shake[0]);
	var PortraitY = 50;
	
	//Set color/font
	draw_set_color(c_white);
	draw_set_font(fnt_stats);
	
	//Draw player portrait
	draw_sprite(sGUIPlayerInfo,0,PortraitX,PortraitY);
	draw_sprite(sGUIPlayerInfo,1,PortraitX,PortraitY+100);
	
	//Draw player status
	draw_text(PortraitX+DPhpx,PortraitY+DPhpy,round(DrawPlayerHealth));
	draw_text(PortraitX+DPhpx,PortraitY+DPhpy+DPoffy,round(DrawPlayerPP));
	
	//Draw battle timer
	if(BattleTimer > 0)
	{
		var TimerPosX = GUIWidth/2;
		var TimerPosY = GUIHeight/1.3;
		var BarHeight = 20;
		
		draw_sprite(sBattleTimer,0,TimerPosX-BarWidth/2-100,TimerPosY);
		draw_set_color(c_black);
		draw_rectangle(TimerPosX-BarWidth/2,TimerPosY+BarHeight/2,TimerPosX+BarWidth/2,TimerPosY-BarHeight/2,false);
		draw_set_color(c_red);
		var BattleTimerNum = ((round(BattleTimer/60/BattleTimerInit*16)/16)*BarWidth);
		draw_rectangle(TimerPosX-BarWidth/2,TimerPosY+BarHeight/2,TimerPosX-BarWidth/2+BattleTimerNum,TimerPosY-BarHeight/2,false);
	}
}

