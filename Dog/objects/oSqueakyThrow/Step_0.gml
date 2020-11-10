/// @description Insert description here
// You can write your code in this editor
if (PickedUp = true) and keyboard_check_pressed(ord("D"))
{
instance_create_layer(oDog.x,oDog.y,"Instances",oSqueaky);
oSqueaky.speed = 7;
oSqueaky.direction = random_range(0,360);
PickedUp = false;
}
