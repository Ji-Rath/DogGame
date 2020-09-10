
StruggleRight = true;
Counter = 0;
Complete = false;
Interact = false;
CompleteCounter = 10;
DealEnemyDamage = false;

phy_active = false;
alarm[0] = 2*60;

MouseCollision = 0;
ButtonAlternate = instance_create_layer(room_width/1.1, room_height/2+300, "Instances", oButtonSignal);
ButtonAlternate.sprite_index = sButtonAlternate;