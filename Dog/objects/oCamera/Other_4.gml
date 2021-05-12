/// @description Insert description here
// You can write your code in this editor

if(instance_exists(Follow))
{
	SnapCamera(Follow.x, Follow.y);
}
else
{
	SnapCamera(room_width/2, room_height/2);	
}