/// @description Insert description here
// You can write your code in this editor

event_inherited();

/*
TextIntro = [
    ["SICKO MODE"],
    ["YOU GONNA GET CRABBED ON"],
    ["CAUGHT BETWEEN A CRAB, AND A HARD PLACE"]
];
TextDuring = [
    ["My right claw is a lot stronger than my left"],
    ["You don't stand a chance"]
];
*/

AttackDamage = 3;
Name = "Crab"


////////////////////////////////////////////////////////////////////////////

MaxHealth = Health;
EnemyAttacks = [Game.CrabWeigh, Game.DogTan];
Angry = false;

function PerformTurn()
{
	if (!Angry && Health < MaxHealth/2)
	{
		with (oBattleManager)
		{
			SpeedMultiplier -= 0.25;
			BattleTimerInit = 20*SpeedMultiplier; //Time for player turn (seconds)
			NextTurn(1);
			AddEnemy(oCrab, 2);
		}
		Angry = true;
	}
	else
	{
		var MiniGame = instance_create_layer(0,0,"GameManager",oMiniGame);
		MiniGame.GameType = PickRandomGame();
	}
}