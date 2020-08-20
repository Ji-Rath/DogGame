
//Inherit parent code
event_inherited();

//Give a unique value to track the NPC
Key = room_get_name(room)+"Trigger"+string(x)+string(y);

//Text array
Text = [];

//Face sprite array
Face = [];

//Face index to use
FaceIndex = [];

//Variable to prevent infinite talking
TextCooldown = false;

//Track NPC speed
HSpeed = 0;
VSpeed = 0;