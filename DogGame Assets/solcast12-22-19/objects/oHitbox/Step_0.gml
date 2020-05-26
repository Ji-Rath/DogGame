/// @description Insert description here
// You can write your code in this editor
x = creator.x;
y = creator.y;

var parryspawnx = (oPlayer.x + x)*0.5;
var parryspawny = (oPlayer.y + y)*0.5;

if (place_meeting(x+(1.2*creator.hsp),y,oParry)) and (oParry.state = parrystates.active)
{
	oPlayer.state = states.Playerparry;
	creator.state = creatorparried;
	
	if (parriedspark == noone)
	{
		parriedspark = instance_create_layer(parryspawnx,parryspawny,"parryspark",oParryspark);
	}
	parried = 1;
	
	
}
else
{
	parried = 0;
	
	
}


if (parried = 1)
{
	state = hitboxstates.inactive;
	
}


if (state = hitboxstates.active)
{
	if (place_meeting(x,y,oPlayer))
	{
		oPlayer.state = states.PlayerKnockback;
		oPlayer.kbhsp = sign(creator.hsp)*creatorstrength
		oPlayer.image_xscale = -sign(creator.hsp)*oPlayer.scale;
		hit = 1;
	
	}
	else
	{
		hit = 0;
		
	}

	
}
else if (state = hitboxstates.inactive)
{
	
	
	
}