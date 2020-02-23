/// @description Insert description here
// You can write your code in this editor
if(Target != -1)
{
	if (FadeIn)
	{
		image_alpha += FadeSpeed;
		if (image_alpha == 1)
		{
			room_goto(Target);
			FadeIn = false;
		}
		
	} 
	else 
	{
		image_alpha -= FadeSpeed;
		if (image_alpha < 0)
		{
			instance_destroy();
		}
		if(XDest != 0 && YDest != 0 && image_alpha > 0.75)
		{
			oDogPaddler.x = XDest;
			oDogPaddler.y = YDest;
			oDogPaddler.sprite_index = Sprite;
			oDogPaddler.image_xscale = SpriteXScale;
			oCamera.x = XDest;
			oCamera.y = YDest;
		}
	}
}

draw_set_color(FadeColor);
draw_set_alpha(image_alpha);
draw_rectangle(0,0, view_wport*2, view_hport*2,false)
draw_set_alpha(1);