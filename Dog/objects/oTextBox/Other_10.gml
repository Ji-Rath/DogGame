/// @description Delayed create event

if(!variable_instance_exists(self, "Sequence")) exit;

//Create and play intro sequence
var Camera = view_camera[0];
var ViewWidthHalf = camera_get_view_width(Camera) * 0.5;
var ViewHeightHalf = camera_get_view_height(Camera) * 0.5;
Seq = layer_sequence_create("GUI", camera_get_view_x(Camera)+ViewWidthHalf, camera_get_view_y(Camera)+ViewHeightHalf, Sequence);
SeqInstance = layer_sequence_get_instance(Seq);

//Override sequence oTextBox object to use (this) one
sequence_instance_override_object(SeqInstance, oTextBox, self);
TextPositionRef = instance_find(oTextPosition, 0);

//Textbox variables
PausePunctuation = true;
PunctuationDelay = 0.5;
NewLineCutOff = 30;

//Default values
Voice				= sndVoice_01;
Font				= fnt_dialogue;
Name				= "???";
