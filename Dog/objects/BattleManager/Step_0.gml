/// @description Insert description here
// You can write your code in this editor
count ++;

if (enemyspawn = noone)
{
	enemyspawn = instance_create_layer(640,390,"Instances",oCrabBattle)
	enemyname = "A Crab"
}



//After 1/2 second, render text
if (count = 30)
{
	var textbuffer = string(enemyname) + " has attacked!"
	var EnemyTextIntro = enemyspawn.TextIntro[random_range(0,array_length_1d(enemyspawn.TextIntro))];
	//text = [textbuffer, "THIS IS A TEST", "THIS IS COOL!"]
	//create_battlebox(text);
	var BattleText = instance_create_layer(x,y,"text",oBattleBox);
	BattleText.text = [textbuffer,EnemyTextIntro];
}
