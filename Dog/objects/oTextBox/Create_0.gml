/// @description Insert description here
// You can write your code in this editor

TextArray = []; //Array of text
Page = 0; //Counter for curent page
TextPos = 0; //Text position

TextMaxWidth = 500;

//Draw dialogue positions
var GUIWidth = display_get_gui_width();
var GUIHeight = display_get_gui_height();
var PortraitWidth = sprite_get_width(sPortraitFrame);
var BoxWidth = sprite_get_width(sTextBox)/2;
var BoxHeight = sprite_get_height(sTextBox)/2;

BoxX = GUIWidth/2-BoxWidth/2+PortraitWidth/2;
BoxY = GUIHeight-BoxHeight;
FaceX = GUIWidth/2-BoxWidth/2;
FaceY = GUIHeight-BoxHeight/2;
TextX = GUIWidth/2-BoxWidth/2+125;
TextY = GUIHeight-(BoxHeight/2)*1.5;

KeyWait = true;
