
//Update speed
WalkSpd = 4;

//Run animation
scrRun();

//Get player direction in x and y directions
var PlayerDirectionX = sign(floor((oDogPaddler.x-x)/4)*4);
var PlayerDirectionY = sign(floor((oDogPaddler.y-y)/4)*4);


//If enemy is out of range + buffer, go to idle
var PlayerDistance = point_distance(x,y,oDogPaddler.x,oDogPaddler.y);
var Buffer = 100;
if (PlayerDistance > (DetectRange+Buffer))
{
	State = estates.Idle;
	timer[0] = choose(1,2,3)*60;
	HSpeed = 0;
	VSpeed = 0;
}

//Follow player 

HSpeed = PlayerDirectionX*WalkSpd;
VSpeed = PlayerDirectionY*WalkSpd;
