Enemy_Walk();
Enemy_detect_normal();

walksp = 2;
hsp = wanderdirx*walksp;
vsp = wanderdiry*walksp;
movement_collision();	
wandercount += 1;
var secs = 1;
if (wandercount > secs*60)
{
	state = estates.idle;
	sprite_index = choose(spritedown,spriteup,hsprite);
	
}

var playerdist = point_distance(x,y,oDogPaddler.x,oDogPaddler.y);

if (playerdist < detectrange)
{
	state = estates.alert
}
