
//Update speed
WalkSpd = 4;

//Run animation
scrRun();

//Get player direction in x and y directions
var PlayerDirectionX = sign(oDogPaddler.x-x);
var PlayerDirectionY = sign(oDogPaddler.y-y);


//If enemy is out of range + buffer, go to idle
var PlayerDistance = point_distance(x,y,oDogPaddler.x,oDogPaddler.y);
var Buffer = 100;
if (PlayerDistance > (DetectRange+Buffer))
{
	State = estates.Idle;
	timer[0] = choose(1,2,3)*60;
}

//Follow player 

HSpeed = PlayerDirectionX*WalkSpd;
VSpeed = PlayerDirectionY*WalkSpd;
