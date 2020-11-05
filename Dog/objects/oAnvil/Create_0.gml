
StruggleRight = true;
Counter = 0;
Complete = false;
CompleteCounter = 10;
DogSave = instance_find(oDogSave, 0);
HitObject = false;

phy_active = false;
alarm[0] = (2.5/oBattleManager.SpeedMultiplier)*60;

ButtonAlternate = instance_create_layer(room_width/1.1, room_height/2+300, "Instances", oButtonSignal);
ButtonAlternate.sprite_index = sButtonAlternate;
ButtonAlternate.ObjectFollow = DogSave;