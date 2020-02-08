/// @description Insert description here
// You can write your code in this editor

box = spr_battlebox;
gui_width = display_get_gui_width();
gui_height = display_get_gui_height();
textcol = 0;
text = "";
actioninput = ord("X");

Enemy = oDogPaddler.BattleAttacker;
OriginalEnemy = oDogPaddler.Attacker;

BattleStage = 0;
BattleStageEnd = false;

DPstat = sDPstatnormal;
DPhpx = 315
DPhpy = 535
DPoffy = 630

textcol = c_black;

text_height = string_height("A");

Success = false;

//Create Enemy Object
instance_create_layer(640,390,"Instances",oDogPaddler.BattleAttacker);


//INTRO TEXT - BATTLE STAGE 0
var FirstText = string(Enemy.Name) + " has attacked!"
var EnemyTextIntro = Enemy.TextIntro[random_range(0,array_length_1d(Enemy.TextIntro))];


var BattleText = instance_create_layer(x,y,"text",oBattleTextBox); 
BattleText.text = [FirstText,EnemyTextIntro];

