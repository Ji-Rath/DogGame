
if(CanPress() && Selected)
{   
    //If player clicks on one of the buttons
    for(i=0;i<ds_list_size(Contents);i++)
    {
        var XPos = x+100
        var YPos = y-250+(i*75);
        ItemMouseHover = (point_in_rectangle(mouse_x, mouse_y, XPos-32, YPos-32, XPos+32, YPos+32));
        //If mouse is hovered over item, save item and end loop
        if(ItemMouseHover)
        {
            //End for loop
            ItemMouseHoverSelect = ds_list_find_value(Contents,i);
            i = ds_list_size(Contents);
            
            if(mouse_check_button_pressed(mb_left))
            {
                //Do delayed action based on item selected
                alarm[0] = 0.3*60/oBattleManager.SpeedMultiplier;
                
                //Decrease ItemCount if applicable and update icons
                var ItemCount = ds_map_find_value(oAreaStats.Items, ItemMouseHoverSelect);
                if(ItemCount > 0)
                    ds_map_set(oAreaStats.Items, ItemMouseHoverSelect, ItemCount-1);
                
                //Reset contents of button
                ds_list_clear(Contents);
                
                //Update available items to ds list
                for(var i=0;i<Item.LastItem;i++)
                {
                    if(i != Item.LastItem)
                    {
                        var GroupCheck = oBattleManager.ItemDescription[i];
                        var ItemCount = ds_map_find_value(oAreaStats.Items, i);
                        
                        //Check if ItemIndex matches with the looping item
                        if(GroupCheck[3] == ItemIndex && (ItemCount > 0 || ItemCount == -1))
                        {
                            ds_list_add(Contents,i);
                        }
                    }
                }
                
                //Reset selected item
                ItemMouseHover = false;
            }
        }
    }
}
