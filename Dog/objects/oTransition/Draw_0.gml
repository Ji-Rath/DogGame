/// @description Insert description here
// You can write your code in this editor

var _vx = camera_get_view_x(view_camera[0])+view_xport[0];
var _vy = camera_get_view_y(view_camera[0]+view_yport[0]);
layer_sequence_x(SequenceInstance, _vx+view_wport[0]/2);
layer_sequence_y(SequenceInstance, _vy+view_hport[0]/2);