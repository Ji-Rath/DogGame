var disttowards = point_distance(x,y,oDogPaddler.x,oDogPaddler.y);
var i = 300;
if (disttowards < i )
{
	
	if (sprite_index = hsprite)  
	{
		
		var m = oDogPaddler.x - x;
		
		if (sign(image_xscale) = sign(m))
		{
			state = estates.alert;
			
		}
	
	}
	else if (sprite_index = hspritewalk)
	{
		var m = oDogPaddler.x - x;
		
		if (sign(image_xscale) = sign(m))
		{
			state = estates.alert;
			
		}
	}
	else if (sprite_index = spriteup)
	{
		
		var m = oDogPaddler.y - y;
		
		if (m < 0)
		{
			state = estates.alert;
			
		}
		
		
	}
	else if (sprite_index = spriteupwalk)
	{
		var m = oDogPaddler.y - y;
		
		if (m < 0)
		{
			state = estates.alert;
			
		}
		
		
		
		
		
	}
	else if (sprite_index = spritedown)
	{
		var m = oDogPaddler.y - y;
		
		if (m > 0)
		{
			state = estates.alert;
			
		}
		
	}
	else if (sprite_index = spritedownwalk)
	{
		var m = oDogPaddler.y - y;
		
		if (m > 0)
		{
			state = estates.alert;
			
		}
		
	}
}