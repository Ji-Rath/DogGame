
walksp = 2;

//Turn to alert if player in range
scrEnemyDetect();

hsp = 0;
vsp = 0;
idlecount += 1;
var secs = 3;

if (idlecount > secs*60)
{
	state = estates.wander;
	wanderdirx = choose(-1,1)
	wanderdiry = choose (-1,0,1)
}
