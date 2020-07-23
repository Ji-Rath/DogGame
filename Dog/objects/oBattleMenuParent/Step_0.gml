

if(visible && Selected)
{
    //Rotate effect
    Rot += (2*pi)/120;
    RotValue = sin(Rot);
    if(Rot > 2*pi)
    {
        Rot = 0;
    }
    
    //Go straight to attacking with attack button (Can probably be optimized in the future)
    if(ItemIndex == 0)
    {
        //Do Action based on item selected
        ItemMouseHoverSelect = ds_list_find_value(Contents,0);
        var ContentArray = oBattleManager.ItemDescription[ItemMouseHoverSelect];
        var ExecuteArray = ContentArray[4];
        var Len = array_length_1d(ExecuteArray)-1;
        show_debug_message("Item ID: "+string(ItemMouseHoverSelect));
        switch(Len)
        {
            case 0: script_execute(ExecuteArray[0]); break;
            case 1: script_execute(ExecuteArray[0],ExecuteArray[1]); break;
            case 2: script_execute(ExecuteArray[0],ExecuteArray[1],ExecuteArray[2]); break;
            case 3: script_execute(ExecuteArray[0],ExecuteArray[1],ExecuteArray[2],ExecuteArray[3]); break;
            case 4: script_execute(ExecuteArray[0],ExecuteArray[1],ExecuteArray[2],ExecuteArray[3],ExecuteArray[4]); break;
            case 5: script_execute(ExecuteArray[0],ExecuteArray[1],ExecuteArray[2],ExecuteArray[3],ExecuteArray[4],ExecuteArray[5]); break;
        }
        
        with(oBattleMenuParent)
        {
            visible = false;
            Selected = false;
        }
        oBattleManager.visible = false;
        oBattleManager.BattleTimer = 0;
        oBattleManager.DrawTimer = 0;
        oBattleManager.DrawGUI = false;
        Selected = false;
        
        //Increase rage
        oBattleManager.RageMeter += 1;
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
                
                var ContentArray = oBattleManager.ItemDescription[ItemMouseHoverSelect];
                var ExecuteArray = ContentArray[4];
                var Len = array_length_1d(ExecuteArray)-1;
                switch(Len)
                {
                    case 0: script_execute(ExecuteArray[0]); break;
                    case 1: script_execute(ExecuteArray[0],ExecuteArray[1]); break;
                    case 2: script_execute(ExecuteArray[0],ExecuteArray[1],ExecuteArray[2]); break;
                    case 3: script_execute(ExecuteArray[0],ExecuteArray[1],ExecuteArray[2],ExecuteArray[3]); break;
                    case 4: script_execute(ExecuteArray[0],ExecuteArray[1],ExecuteArray[2],ExecuteArray[3],ExecuteArray[4]); break;
                    case 5: script_execute(ExecuteArray[0],ExecuteArray[1],ExecuteArray[2],ExecuteArray[3],ExecuteArray[4],ExecuteArray[5]); break;
                }
                
                with(oBattleMenuParent)
                {
                    visible = false;
                    Selected = false;
                }
                
        		with(oBattleManager)
                {
                    visible = false;
                    DrawGUI = false;
                }
                
                //Increase Rage
                oBattleManager.RageMeter += 1;
            }
        }
    }
}
else
{
    Rot = 0;
    RotValue = 0;
}
