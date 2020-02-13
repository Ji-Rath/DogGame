
if(visible && Selected)
{
    for(i=0;i<ds_list_size(Contents);i++)
    {
        var XPos = x+100
        var YPos = y-250+(i*75);
        ItemMouseHover = (point_in_rectangle(mouse_x, mouse_y, XPos-32, YPos-32, XPos+32, YPos+32));
        //If mouse is hovered over item, save item and end loop
        if(ItemMouseHover)
        {
            ItemMouseHoverSelect = i;
            i = ds_list_size(Contents);
            
            if(mouse_check_button_pressed(mb_left))
            {
                //Do Action based on item selected
                var Action = ds_list_find_value(Contents,ItemMouseHoverSelect);
                switch(Action)
                {
                    case Item.GlovesOff:
                        var MiniGame = instance_create_layer(0,0,"GameManager",oMiniGame);
    				    MiniGame.GameType = Game.GlovesOff;
                    break;
                    
                    case Item.Punch:
                        
                    break;
                    
                    case Item.Hamburger:
                        global.phealth += 10;
                        var BattleText = instance_create_layer(x,y,"text",oBattleTextBox);
        				BattleText.text = ["You eat the tasty burger."];
                    break;
                }
                if(Action != noone)
                {
                    with(oBattleMenuParent)
                    {
                        visible = false;
                        Selected = false;
                    }
                    oBattleManager.visible = false;
                }
                
            }
        }
    }
}
