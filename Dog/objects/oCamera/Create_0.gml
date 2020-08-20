
//Set camera view and object to follow
Camera = view_camera[0];
Follow = oDog

//Set initial position of camera
ViewWidthHalf = camera_get_view_width(Camera) * 0.5;
ViewHeightHalf = camera_get_view_height(Camera) * 0.5;
x = oDog.x;
y = oDog.y;
camera_set_view_pos(Camera,oDog.x-ViewWidthHalf,oDog.y-ViewHeightHalf);

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
