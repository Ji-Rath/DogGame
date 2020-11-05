

Health = 0;
MaxHealth = Health;
AttackDamage = 0;
Name = "";
Angry = false;

EnemyAttacks = [];

/////////////////////////////////////////////////////////////

TextIntro = [""];
TextDuring = [""];
HealthChanged = false;
timer[0] = -1;
Angle = 0;
IsDead = false;
Vulnerable = false;

OpenFraction = 0;
OpenEffect = 0;

function DrawEnemyInit(_ShowEnemy, _DrawSmall) constructor
{
	ShowEnemy = _ShowEnemy;
	DrawSmall = _DrawSmall;
}

EnemyVisibility = new DrawEnemyInit(false, false);

