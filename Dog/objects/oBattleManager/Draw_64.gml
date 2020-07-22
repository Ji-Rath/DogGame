/// @description Insert description here
// You can write your code in this editor

if(DrawGUI)
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
	
}