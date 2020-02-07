sprite_index = spritealert;

movement_collision();

//Create alert sign
if (myalertsign = noone)
{
	myalertsign = instance_create_layer(x,y-100,"effects",alertsign);
	myalertsign.myuser = id;
}
	