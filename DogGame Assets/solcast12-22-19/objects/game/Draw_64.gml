/// @description Insert description here
// You can write your code in this editor
if(doTransition == true)
{
	
	if(room != spawnRoom)
	{
		blackAlpha += 0.1;
		if(blackAlpha >= 1)
		{
			room_goto(spawnRoom)
			
			
		}
		
		
	}
	else
	{
		
		blackAlpha -= 0.1;
		if (blackAlpha <= 0)
		{
			doTransition = false;
			
			
		}
		
	}
	draw_set_alpha(blackAlpha);
	draw_rectangle_color(0,0,2*guiWidth,2*guiHeight,c_black,c_black,c_black,c_black,false);

	draw_set_alpha(1);

}


if (easefromblack == true)
{
	var fadeinsecs = 1;
	fadeincount ++;
	if (fadeincount > fadeinsecs*60)
	blackAlpha2 -= 0.01;
	if (blackAlpha2 <= 0)
	{
		easefromblack = false;
		
		
		
	}
	
	
	
	draw_set_alpha(blackAlpha2);
	draw_rectangle_color(0,0,2*guiWidth,2*guiHeight,c_black,c_black,c_black,c_black,false);

	draw_set_alpha(1);
	
	
}


if (easefromblack2 == true)
{
	var fadeinsecs = 1;
	fadeincount ++;
	if (fadeincount > fadeinsecs*60)
	blackAlpha2 -= 0.05;
	if (blackAlpha2 <= 0)
	{
		easefromblack2 = false;
		
		
		
	}
	
	
	
	draw_set_alpha(blackAlpha2);
	draw_rectangle_color(0,0,2*guiWidth,2*guiHeight,c_black,c_black,c_black,c_black,false);

	draw_set_alpha(1);
	
	
}




