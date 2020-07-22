
StruggleRight = true;
Counter = 0;
Complete = false;
Interact = false;
CompleteCounter = 10;

phy_active = false;
alarm[0] = 1*60;

MouseCollision = 0;
ButtonAlternate = instance_create_layer(room_width/1.1, room_height/2+300, "Instances", oButtonSignal);
ButtonAlternate.sprite_index = sButtonAlternate;