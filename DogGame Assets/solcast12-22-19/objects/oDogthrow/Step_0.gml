/// @description Insert description here
// You can write your code in this editor

	if (x < 0)
	{
		x = room_width;
		
	}
	if (x > room_width)
	{
		x = 0;
	}



movement_collision();
hsp *= movefriction;
vsp += grv;


var distancePlayer = point_distance(x,y,oPlayer.x,oPlayer.y)

if (place_meeting(x,y+2,oWall)) 
{
	
	oDog.state = dogstates.follow2;
	oPlayer.x = x;
	oPlayer.y = y;
	oPlayer.dogthrow = noone;
	instance_destroy();
	instance_create_layer(x,y,"parryspark",oTpspark);
	count = 0;
	
	
	
}
if (place_meeting(x,y,oDeathblock))
{
	oDog.state = dogstates.follow2;
	oPlayer.dogthrow = noone;
	instance_destroy();
	instance_create_layer(x,y,"parryspark",oTpspark);
	count = 0;
}

	/*
	x = oPlayer.x;
	y = oPlayer.y;
	*/
count += 1;
if (count > 65)
{
	x = oPlayer.x;
	y = oPlayer.y;
		
}





if (state = throwstates.airthrow)
{
	
	throwcount += 1;

	if (throwcount < 2)
	{
		sprite_index = sDogFjumpStart;
		image_index = 0;
	
	
	}
	else if (throwcount < 2*20)
	{
	
		sprite_index = sDogFjumpStart;
	
	}
	else 
	{
		sprite_index = sDogFjump;
	
	
	}
	
}
else if (state = throwstates.groundthrow)
{
	
	sprite_index = sDogFjump;
	
	
}