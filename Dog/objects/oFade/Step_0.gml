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
			oDog.x = XDest;
			oDog.y = YDest;
			oDog.sprite_index = Sprite;
			oDog.image_xscale = SpriteXScale;
			oCamera.x = XDest;
			oCamera.y = YDest;
		}
	}
}