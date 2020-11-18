
ItemIndex = 2;
SpriteIndex = 3;
event_inherited();

//Hold textbox text
TextBox = "";

//Handle line indicator while typing
LineIndicator = "|";
alarm[1] = 0.5*60;

//If true, allow player to type
IsFocused = false;

TextBoxX = x+100;
TextBoxY = y-200;
TextBoxWidth = 310;
TextBoxHeight = string_height("I")+10;

/** Menu background, can be a sprite */
SelectMenuBackground = sAttackMenu;