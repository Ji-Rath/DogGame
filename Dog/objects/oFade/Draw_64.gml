/// @description Insert description here
// You can write your code in this editor
if (room != target)
{
	image_alpha += fadespeed;
	if (image_alpha == 1)
	{
		//oDogPaddler.x = xx;
		//oDogPaddler.y = yy;
		room_goto(target);
	}
	
} 
else 
{
	image_alpha -= fadespeed;
	if (image_alpha < 0)
	{
		instance_destroy();
	}
	
	
}

draw_set_color(fadecolor);
draw_set_alpha(image_alpha);
draw_rectangle(0,0, view_wport*2, view_hport*2,false)
draw_set_alpha(1);