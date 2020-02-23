Camera = view_camera[0];
Follow = oDogPaddler

ViewWidthHalf = camera_get_view_width(Camera) * 0.5;
ViewHeightHalf = camera_get_view_height(Camera) * 0.5;
x = oDogPaddler.x;
y = oDogPaddler.y;
camera_set_view_pos(Camera,oDogPaddler.x-ViewWidthHalf,oDogPaddler.y-ViewHeightHalf);
XDestination = 0;
YDestination = 0;

HSpeed = 0;
VSpeed = 0;



enum CameraState
{
	FollowPlayer,
}


State = CameraState.FollowPlayer;


ShakeLength = 0;
ShakeMagnitude = 0;
ShakeRemain = 0;
