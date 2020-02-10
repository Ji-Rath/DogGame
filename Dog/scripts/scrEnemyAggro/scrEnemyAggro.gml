walksp = 4;

scrEnemyRun();

var playerdirx = sign(oDogPaddler.x-x);
var playerdiry = sign(oDogPaddler.y-y);


var playerdist = point_distance(x,y,oDogPaddler.x,oDogPaddler.y);
var distbuffer = 50;
if (playerdist > (detectrange+50))
{
	
	state = estates.idle;
	sprite_index = choose(spritedown,spriteup,hsprite);
	
}

var playerdistx = abs(oDogPaddler.x - x);
var playerdisty = abs(oDogPaddler.y - y);
var disttowards = point_distance(x,y,oDogPaddler.x,oDogPaddler.y)
if (disttowards < 2*distbuffer)
{
	hsp = playerdirx*walksp;
	vsp = playerdiry*walksp;
}
else
{
	if (playerdistx < distbuffer)
	{
		hsp = 0;
	}
	else
	{
	
		hsp = playerdirx*walksp;
	}

	if (playerdisty < distbuffer)
	{
	
		vsp = 0;
	}
	else
	{
		vsp = playerdiry*walksp;
	
	}
}