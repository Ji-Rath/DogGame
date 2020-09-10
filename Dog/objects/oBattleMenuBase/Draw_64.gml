
if(in_sequence) exit;

//Set Fonts/Color
draw_set_font(fnt_battle);
draw_set_color(c_black);

//Draw interface
if(Selected)
{
    draw_sprite(sAttackMenu,0,x,y);
    
    //Draw text box for magic book
    if(ItemIndex != 2)
    {
        //Draw Contents
        for(i=0;i<ds_list_size(Contents);i++)
        {
            //Draw available contents 
            
            var ArrayIndex = ds_list_find_value(Contents,i);
            var DescArray = oBattleManager.ItemDescription[ArrayIndex];
            var ItemCount = ds_map_find_value(oAreaStats.Items, ArrayIndex);
            draw_sprite(DescArray[2],0,x+100,y-250+(i*75));
            if(ItemCount > 1)
            {
                draw_text(x+100,y-250+(i*75),ItemCount);
            }
            
        }
        
        if(ItemMouseHover)
        {
            var DescArray = oBattleManager.ItemDescription[ItemMouseHoverSelect];
            draw_sprite(sAttackInfo,0,x,y);
            draw_set_font(fnt_stats);
            draw_text(x+80,y-470,DescArray[0]);
            draw_text(x+80,y-420,DescArray[1]);
        }
    }
}
