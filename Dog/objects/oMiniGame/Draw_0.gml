
//Draw MiniGame Boundries
draw_set_color(c_ltgray);
draw_roundrect(room_width/2+500,room_height/2+(250*OpenEffect),room_width/2-500,room_height/2-(250*OpenEffect),false)
draw_set_color(c_white);

for(i=0;i<ds_list_size(Instances);i++)
{
    with(ds_list_find_value(Instances,i))
    {
        image_alpha = oMiniGame.OpenEffect;
    }
}