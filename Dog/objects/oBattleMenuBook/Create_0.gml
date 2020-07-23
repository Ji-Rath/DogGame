
ItemIndex = 2;
event_inherited();
SpriteIndex = 3;

//Hold textbox text
TextBox = "";

//Handle line indicator while typing
LineIndicator = "|";
alarm[0] = 0.5*60;

//If true, allow player to type
IsFocused = false;

TextBoxX = x+100;
TextBoxY = y-200;
TextBoxWidth = 310;
TextBoxHeight = string_height("I")+10;