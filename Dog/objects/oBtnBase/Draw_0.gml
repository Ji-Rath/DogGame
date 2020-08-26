
draw_set_font(fnt_dialogue);
draw_set_color(TextColor);
draw_set_halign(fa_left);
draw_set_valign(fa_center);
draw_text_transformed(x,y,ButtonText, image_xscale, image_yscale, image_angle);
draw_set_valign(fa_top);

if(global.Debug)
	draw_rectangle(bbox_left, bbox_top, bbox_left+string_width(ButtonText), bbox_top+string_height(ButtonText), true);