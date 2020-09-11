/// @description Insert description here
// You can write your code in this editor

if(!Opened)
{
    repeat(15)
    {
        var Chip = instance_create_layer(x,y,"Instances",oChip);
        Chip.speed = random_range(10,30);
        Chip.direction = 90+random_range(-55,55);
        ds_list_add(oMiniGame.Instances, Chip);
    }
    Opened = true;
}