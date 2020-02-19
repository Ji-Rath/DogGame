

if(visible && Selected)
{
    //Rotate effect
    Rot += (2*pi)/120;
    RotValue = sin(Rot);
    if(Rot > 2*pi)
    {
        Rot = 0;
    }
    
    
    
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
                //Do Action based on item selected
                var ContentArray = ItemContent[ItemMouseHoverSelect];
                var Len = array_length_1d(ContentArray)-1;
                switch(Len)
                {
                    case 0: script_execute(ContentArray[0]); break;
                    case 1: script_execute(ContentArray[0],ContentArray[1]); break;
                    case 2: script_execute(ContentArray[0],ContentArray[1],ContentArray[2]); break;
                    case 3: script_execute(ContentArray[0],ContentArray[1],ContentArray[2],ContentArray[3]); break;
                }
                with(oBattleMenuParent)
                {
                    visible = false;
                    Selected = false;
                }
                oBattleManager.visible = false;
                oBattleManager.BattleTimer = 0;
                
            }
        }
    }
}
else
{
    Rot = 0;
    RotValue = 0;
}
