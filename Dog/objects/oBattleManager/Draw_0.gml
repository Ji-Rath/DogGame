
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

draw_set_alpha(Alpha);
var GUIWidth = display_get_gui_width();
var GUIHeight = display_get_gui_height();
	
var PortraitX = 50+choose(Shake[0],-Shake[0]);
var PortraitY = 50;
	
//Set color/font
draw_set_color(c_white);
draw_set_font(fnt_stats);
	
//Draw player portrait
draw_sprite(sUIPlayer,0,PortraitX,PortraitY);
draw_sprite(sUIPlayer,1,PortraitX,PortraitY+100);
	
//If player is smelly...i mean hungry, draw effect
if(global.PlayerPP <= 0)
{
	draw_sprite(sEffectHungry, image_index, PortraitX+50, PortraitY+50);
}
if(NeglectMeter >= MaxNeglect)
{
	draw_sprite(sEffectNeglect, image_index, PortraitX+50, PortraitY+100+50);
}
	
//Draw player status
draw_text(PortraitX+DPhpx,PortraitY+DPhpy,round(DrawPlayerHealth));
draw_text(PortraitX+DPhpx,PortraitY+DPhpy+DPoffy,round(DrawPlayerPP));
draw_set_alpha(1);

