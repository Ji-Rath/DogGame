
if(alarm[0] == -1)
{
    //Draw MiniGame Boundries
    draw_set_color(c_ltgray);
    
    if(DrawSmall)
    {
        draw_roundrect(SmallScreenPosX+250,SmallScreenPosY+(125*OpenEffect),SmallScreenPosX-250,SmallScreenPosY-(125*OpenEffect),false)
    }
    else
    {
        draw_roundrect(room_width/2+500,room_height/2+(250*OpenEffect),room_width/2-500,room_height/2-(250*OpenEffect),false)
        if(timer[1] != -1)
        {
            draw_set_color(c_red);
            var Time = round((timer[1]/(4*60))*12)/12;
            draw_rectangle(room_width/2-500+(Time*1000),room_height/2+250,room_width/2-500,room_height/2+225,false);
        }
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