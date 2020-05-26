/// @description Insert description here
// You can write your code in this editor
with (player)
{
	if (place_meeting(x,y,other))
	{
		if (key_actionpressed)
		{
			other.teleporter = instance_create_layer(x,y,"parryspark",oPortal)
			other.teleporter.targetx = other.targetx;
			other.teleporter.targety = other.targety;
			other.teleporter.targetroom = other.targetroom;
			
		}
		
	}
	
}