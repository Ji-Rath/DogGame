
if(alarm[0] == -1)
{
    //Draw MiniGame Boundries
    draw_set_color(c_ltgray);
	draw_set_alpha(OpenEffect);
    
    if(!DrawSmall)
    {
        //draw_roundrect(room_width/2+500,room_height/2+(250*OpenEffect),room_width/2-500,room_height/2-(250*OpenEffect),false)
        
        //Draw timer for minigame
        if(timer[1] != -1)
        {
            draw_set_color(c_red);
            var Time = timer[1]/(MiniGameTime*60);
            draw_rectangle(room_width/2-500+(Time*1000),room_height/2+250,room_width/2-500,room_height/2+225,false);
        }
        //Draw helptext
        draw_set_halign(fa_middle);
        draw_set_color(c_ltgray);
        draw_set_font(fnt_battle);
        draw_text(room_width/2,25, string_upper(HelpText));
        draw_set_alpha(1);
        draw_set_halign(fa_left);
    }
    
    draw_set_color(c_white);
    
    for(i=0;i<ds_list_size(Instances);i++)
    {
        with(ds_list_find_value(Instances,i))
        {
            image_alpha = oMiniGame.OpenEffect;
        }
    }
}