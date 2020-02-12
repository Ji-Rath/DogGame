Camera = view_camera[0];
Follow = oDogPaddler

ViewWidthHalf = camera_get_view_width(Camera) * 0.5;
ViewHeightHalf = camera_get_view_height(Camera) * 0.5;
XDestination = xstart;
YDestination = ystart;

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
