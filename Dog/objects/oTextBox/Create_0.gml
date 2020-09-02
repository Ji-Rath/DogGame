/// @description Delayed create event

if(!variable_instance_exists(self, "Sequence")) exit;

//Create and play intro sequence
Seq = layer_sequence_create("Instances", view_xport[0] + view_wport[0]/2, view_yport[0] + view_hport[0]/2, Sequence);
SeqInstance = layer_sequence_get_instance(Seq);

//Override sequence oTextBox object to use (this) one
sequence_instance_override_object(SeqInstance, oTextBox, self);
TextPositionRef = instance_find(oTextPosition, 0);

//Textbox variables
PausePunctuation = true;
PunctuationDelay = 0.5;
NewLineCutOff = 100;

//Default values
Voice				= sndVoice_01;
Font				= fnt_dialogue;
Name				= "???";