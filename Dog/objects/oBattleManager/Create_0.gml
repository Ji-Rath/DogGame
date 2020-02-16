/// @description Insert description here
// You can write your code in this editor

box = sBattleBox;
gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

//Assign enemy objects to variables and store unique id
EnemyBattle = oAreaStats.EnemyBattle;
EnemyKey = oAreaStats.EnemyKey;

//Create variables to keep track of battle stage
BattleStage = 0;
BattleStageEnd = false;

//Portait position
DPstat = sDPstatnormal;
DPhpx = 170
DPhpy = 17
DPoffy = 50

text_height = string_height("A");


//Create Enemy Object
EnemyBattle = instance_create_layer(640,390,"Instances",EnemyBattle);

//Create BattleMenu variables
enum BattleMenu
{
    Attack,
    Bag,
    Defend,
    Book
}
BattleSelect = BattleMenu.Attack;


//INTRO TEXT - BATTLE STAGE 0
var FirstText = string(EnemyBattle.Name) + " has attacked!"
var EnemyTextIntro = EnemyBattle.TextIntro[random_range(0,array_length_1d(EnemyBattle.TextIntro))];

var BattleText = instance_create_layer(x,y,"text",oBattleTextBox); 
BattleText.text = [FirstText,EnemyTextIntro];

//Create BattleMenu
instance_create_layer(room_width/2-150,room_height-100,"GUI",oBattleMenuAttack);
instance_create_layer(room_width/2-50,room_height-100,"GUI",oBattleMenuBag);
instance_create_layer(room_width/2+50,room_height-100,"GUI",oBattleMenuDefend);
instance_create_layer(room_width/2+150,room_height-100,"GUI",oBattleMenuBook);

//Timer Bar Width
BarWidth = 400;
BattleTimer = 0;
BattleTimerInit = 20;

//Update stats effect
UpdateStats = false;
DrawPlayerHealth = global.phealth;
DrawPlayerPP = global.pp;
DrawEnemyHealth = EnemyBattle.Health;
timer[0] = -1;

//Shake effect
for(i=0;i<2;i++)
{
	Shake[i] = 0;
}
