
event_inherited();

ItemContent[Item.GlovesOff,0] = "Gloves Off"; //Sprite of item
ItemContent[Item.GlovesOff,1] = "Its Time"; //Description of item
ItemContent[Item.GlovesOff,2] = sEnemyalert; //Sprite of item

ItemContent[Item.Punch,0] = "Big Penny"; //Sprite of item
ItemContent[Item.Punch,1] = "Throw a big punch"; //Description of item
ItemContent[Item.Punch,2] = sEnemydown; //Sprite of item

SpriteIndex = 0;

ds_list_add(Contents,Item.GlovesOff);
ds_list_add(Contents,Item.Punch);