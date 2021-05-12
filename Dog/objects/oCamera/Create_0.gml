
//Set camera view and object to follow
Camera = view_camera[0];
Follow = oDog;

//Set initial position of camera
ViewWidthHalf = camera_get_view_width(Camera) * 0.5;
ViewHeightHalf = camera_get_view_height(Camera) * 0.5;

//Track the camera destination
XDestination = 0;
YDestination = 0;

//Camera States
enum CameraState
{
	FollowPlayer,
}

//Current state of camera
State = CameraState.FollowPlayer;

//Screen shake values
ShakeLength = 0;
ShakeMagnitude = 0;
ShakeRemain = 0;

function ScreenShake(Length, Magnitude)
{
	ShakeLength = Length;
	ShakeMagnitude = Magnitude;
	ShakeRemain = ShakeLength;
}

/// @func Snap the camera to a specified position
function SnapCamera(XCenter, YCenter)
{
	x = XCenter;
	y = YCenter;
	XDestination = x;
	YDestination = y;
	camera_set_view_pos(Camera, x-ViewWidthHalf, y-ViewHeightHalf);	
}
