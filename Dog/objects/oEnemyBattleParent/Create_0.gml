
MaxHealth = Health;
AttackDamage = 0;
Name = "";

EnemyAttacks = [];

/////////////////////////////////////////////////////////////

HealthChanged = false;
timer[0] = -1;
Angle = 0;
IsDead = false;
Vulnerable = false;
DrawEnemyHealth = Health;

OpenFraction = 0;
OpenEffect = 0;

path_start(pathEnemyTurn, 10, path_action_restart, true);
PathPos = 0;

function DrawEnemyInit(_ShowEnemy, _DrawSmall) constructor
{
	ShowEnemy = _ShowEnemy;
	DrawSmall = _DrawSmall;
}

/// @func ShiftEnemies(bTeleport)
/// @desc Shift enemies counter clockwise on an interval based on the enemy count
/// @arg {bool} bTeleport=false
function ShiftEnemies()
{
	var bTeleport = argument_count > 0 ? argument[0] : false;
	var ShiftAmount = argument_count > 1 ? argument[1] : 1;
	var bHasFocus = false;
	with (oEnemyBattleParent)
	{
		var InstCount = instance_number(oEnemyBattleParent);
		MoveInterval = ShiftAmount / InstCount;
		PathPos = LoopValue(PathPos, MoveInterval, 0, 1);
		if (PathPos == 1)
			PathPos = 0;
		if (bTeleport)
		{
			path_position = PathPos;
		}
		else
		{
			path_speed = 10;
		}
		
		if (PathPos == 0)
			bHasFocus = true;
	}
	if (!bHasFocus)
	{
		CalculatePosition();	
	}
}

/// @desc Pick a random minigame in EnemyAttacks array
/// @return {enum} minigame
function PickRandomGame()
{
	return 	EnemyAttacks[random_range(0,array_length(EnemyAttacks))];
}

function PerformTurn()
{
	var MiniGame = instance_create_layer(0,0,"GameManager",oMiniGame);
	MiniGame.GameType = PickRandomGame();
}

/// @func CalculatePosition(bEnemyDeath=false);
/// @desc Reposition enemies in appropriate position based on enemies alive
/// @arg {bool} bEnemyDeath=false
function CalculatePosition()
{
	var Count = instance_number(oEnemyBattleParent);
	var InstCount = Count;
	with (oEnemyBattleParent)
	{
		if (Health <= 0)
			Count--;
	}
	MoveInterval = 1 / Count;
	var CurrentPos = 0;
	for(var i=0;i<InstCount;i++)
	{
		var Inst = instance_find(oEnemyBattleParent, i);
		if (Inst.Health >= 0)
		{
			Inst.PathPos = MoveInterval * CurrentPos;
			Inst.path_position = PathPos;
			CurrentPos++;
		}
	}
}

EnemyVisibility = new DrawEnemyInit(false, false);

