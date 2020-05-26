/// @description Insert description here
// You can write your code in this editor


if (instance_exists(oChest))
{
	if (oChest.sprite_index = sShovelpull)
	{
		count += 1;
		if (count > 2*28)
		{
			image_alpha -= 0.005;
			if (image_alpha < 0.1)
			{
				instance_destroy();
		
		
			}
	
		
		
		}
	
	
	}
}
else
{
	instance_destroy();
	
}