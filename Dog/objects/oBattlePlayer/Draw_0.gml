/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

//If player is smelly...i mean hungry, draw effect
if(global.PlayerPP <= 0)
	draw_sprite(sEffectHungry, image_index, XPos, YPos);

//Draw player status
scribble_set_box_align( fa_left, fa_middle);
scribble_draw(XPos,YPos,round(DisplayHealth));
scribble_draw(XPos,YPos,round(DisplayPP));

for (i=0;i<BlockableAttacks;i++)
{
	draw_sprite(sShield, 0, XPos-50 + (i*50) ,YPos+50)	
}

draw_set_alpha(1);