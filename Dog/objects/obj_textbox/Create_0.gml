/// @description Insert description here
// You can write your code in this editor

Text = []; //Array of text
Page = 0; //Counter for current page
TextPos = 0; //Text position
Face = []; //Array of sprites
FaceIndex = []; //Array of indexes for each sprite
Speaker = noone; //NPC object that is speaking

TextMaxWidth = 500;

KeyInteract = oDogPaddler.bind_action;

//Draw dialogue positions
var GUIWidth = display_get_gui_width();
var GUIHeight = display_get_gui_height();
var PortraitWidth = sprite_get_width(spr_portraitframe);
var BoxWidth = sprite_get_width(spr_dialoguebox);
var BoxHeight = sprite_get_height(spr_dialoguebox);

BoxX = GUIWidth/2+PortraitWidth/2;
BoxY = GUIHeight-BoxHeight/2;
FaceX = GUIWidth/2-BoxWidth/2;
FaceY = GUIHeight-BoxHeight/2;
TextX = GUIWidth/2-BoxWidth/2+125;
TextY = GUIHeight-(BoxHeight/2)*1.5;
