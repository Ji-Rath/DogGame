cam = view_camera[0];
follow = oDogPaddler

view_w_half = camera_get_view_width(cam) * 0.5;
view_h_half = camera_get_view_height(cam) * 0.5;
xTo = xstart;
yTo = ystart;

hsp = 0;
vsp = 0;



enum camstates
{
	followplayer,
	matchmob,
	swoop,
	pause
}


state = camstates.followplayer;


shake_length = 0;
shake_magnitude = 0;
shake_remain = 0;
