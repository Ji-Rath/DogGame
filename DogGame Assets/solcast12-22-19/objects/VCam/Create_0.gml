cam = view_camera[0];
follow = oPlayer;
mob = oMob;
view_w_half = camera_get_view_width(cam) * 0.5;
view_h_half = camera_get_view_height(cam) * 0.5;
xTo = xstart;
yTo = ystart;
swoopincrement = 1;
hsp = 0;
vsp = 0;
speedoffsetx = 0;
speedoffsety = 0;
pausecount = 0;
hinc = 0;
vinc = 0;

countnew = 0;

enum camstates
{
	followplayer,
	matchmob,
	swoop,
	pause
	
	
}


state = camstates.followplayer;

cloudcount = 0;

shake_length = 0;
shake_magnitude = 0;
shake_remain = 0;
buff = 0;