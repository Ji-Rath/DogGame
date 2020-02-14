
//Set Fonts/Color
draw_set_font(fnt_battle);
draw_set_color(c_black);
var CanScale = (IsHovering || Selected)
var Scale = 1;
if(CanScale)
{
    Scale *= 1.25;
}



//Draw icon
draw_sprite_ext(sBattleIcons,SpriteIndex,x,y,Scale,Scale,RotValue*25,c_white,1);

//Draw interface
if(Selected)
{
    draw_sprite(sBattleMenu1,0,x,y);
    
    //Draw Contents
    for(i=0;i<ds_list_size(Contents);i++)
    {
        //Draw available contents
        draw_sprite(ItemContent[ds_list_find_value(Contents,i),2],0,x+100,y-250+(i*75));
    }
    
    if(ItemMouseHover)
    {
        draw_sprite(sBattleMenu2,0,x,y);
        draw_set_font(fnt_stats);
        draw_text(x+80,y-470,ItemContent[ds_list_find_value(Contents,ItemMouseHoverSelect),0]);
        draw_text(x+80,y-420,ItemContent[ds_list_find_value(Contents,ItemMouseHoverSelect),1]);
    }
}
