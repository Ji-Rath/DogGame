/// @description Insert description here
// You can write your code in this editor

//Initialize Itembar variables
scrItems();

//Assign enemy objects to variables and store unique id
EnemyBattle = oAreaStats.EnemyBattle;
EnemyKey = oAreaStats.EnemyKey;

//Current battle stage
BattleStage = 0;

//If true, go to next battle stage
BattleStageEnd = false;

//Mark player portrait position
DPstat = sDPstatnormal;
DPhpx = 170
DPhpy = 17
DPoffy = 50

Alpha = 0;

//Create Enemy Object
EnemyBattle = instance_create_layer(640,390,"Instances",EnemyBattle);

//INTRO TEXT - BATTLE STAGE 0
CreateBattleTextEvent(["A "+string(EnemyBattle.Name) + " has attacked!"], true, new TextInit(0.05, c_black, 1));

//Create BattleMenu
//instance_create_layer(room_width/2-150,room_height-100,"GUI",oBattleMenuAttack);
//instance_create_layer(room_width/2-50,room_height-100,"GUI",oBattleMenuBag);
//instance_create_layer(room_width/2+50,room_height-100,"GUI",oBattleMenuDefend);
//instance_create_layer(room_width/2+150,room_height-100,"GUI",oBattleMenuBook);

//Timer Bar Width
BarWidth = 400;
BattleTimer = 0;
BattleTimerInit = 20;

//Update stats effect
UpdateStats = false;
DrawPlayerHealth = global.PlayerHP;
DrawPlayerPP = global.PlayerPP;
DrawEnemyHealth = EnemyBattle.Health;
DrawTimer = BattleTimer;
timer[0] = -1;

//Shake effect
for(i=0;i<2;i++)
{
	Shake[i] = 0;
}

//Rage meter
RageMeter = 0;

//Value to trigger rage attack
MaxRage = 3;

//Neglect meter
NeglectMeter = 0;

//Value to trigger neglect effects
MaxNeglect = 30;

DrawGUI = false;

image_speed = 0.1;