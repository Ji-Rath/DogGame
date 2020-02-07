/// @description Insert description here
// You can write your code in this editor
x = myuser.x;
y = myuser.y - 100;

if(timer[0] > 0)
{
    timer[0] -= 1;
}
else
{
    myuser.state = estates.aggro;
    myuser.myalertsign = noone;
    instance_destroy();
}
