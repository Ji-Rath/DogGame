
MaxHealth = Health;
AttackDamage = 0;
Name = "";
Angry = false;

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
	var bHasFocus = false;
	with (oEnemyBattleParent)
	{
		InstCount = instance_number(oEnemyBattleParent);
		MoveInterval = 1 / InstCount;
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

/// @func CalculatePosition(bEnemyDeath=false);
/// @desc Reposition enemies in appropriate position based on enemies alive
/// @arg {bool} bEnemyDeath=false
function CalculatePosition()
{
	var bEnemyDeath = argument_count > 0 ? argument[0] : false;
	var Count = instance_number(oEnemyBattleParent);
	InstCount = bEnemyDeath ? Count-1 : Count;
	MoveInterval = 1 / InstCount;
	for(var i=0;i<InstCount;i++)
	{
		var Inst = instance_find(oEnemyBattleParent, i);
		Inst.PathPos = MoveInterval * i;
		Inst.path_position = PathPos;
	}
}

EnemyVisibility = new DrawEnemyInit(false, false);

