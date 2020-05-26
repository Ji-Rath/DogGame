/// @description Insert description here
// You can write your code in this editor



movement();



if (state == movingplatformstates.movingright)
{
	moveleftcount = 0;

	moveupcount = 0;
	movedowncount = 0;
	
	
	moverightcount ++;
	
	
	if (moverightcount > 100)
	{
		state = movingplatformstates.movingleft;
		
	}
	
	
	
	hsp += movesp;
	vsp += 0;
	hsp *= movefriction;
	vsp *= movefriction;
	
}
else if (state == movingplatformstates.movingleft)
{

	moverightcount = 0;
	moveupcount = 0;
	movedowncount = 0;
	
	
	moveleftcount += 1;
	if (moveleftcount > 100)
	{
		state = movingplatformstates.movingright;
		
	}
	
	
	
	hsp += -movesp;
	vsp += 0;
	hsp *= movefriction;
	vsp *= movefriction;
}
else if (state == movingplatformstates.movingup)
{
	moveleftcount = 0;
	moverightcount = 0;

	movedowncount = 0;

	
	moveupcount += 1;
	if (moveupcount > 100)
	{
		state = movingplatformstates.movingdown;
		
	}
	
	
	hsp += 0;
	vsp += -movesp;
	hsp *= movefriction;
	vsp *= movefriction;
}
else if (state == movingplatformstates.movingdown)
{
	moveleftcount = 0;
	moverightcount = 0;
	moveupcount = 0;


	
	movedowncount += 1;
	if (movedowncount > 100)
	{
		state = movingplatformstates.movingup;
		
	}
	
	hsp += 0;
	vsp += movesp;
	hsp *= movefriction;
	vsp *= movefriction;
}













