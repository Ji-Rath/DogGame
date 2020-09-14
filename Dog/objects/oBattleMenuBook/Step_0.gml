
scrAnimStep();

if(visible && Selected)
{
    //Update text if focused
    if(IsFocused)
    {
        TextBox = string_upper(keyboard_string);
        if(string_length(keyboard_string) > 14)
        {
            TextBox = string_copy(TextBox, 0, 14);
            keyboard_string = TextBox;
        }
    }
    
    if(keyboard_check_pressed(vk_enter))
    {
        var Description;
        for(i=0;i<Item.LastItem;i++)
        {
            Description = oBattleManager.ItemDescription[i];
            
            //Perform minigame if text is valid
            if(Description[3] == ItemIndex)
            {
                if(TextBox == string_upper(Description[0]))
                {
                    if (oBattleManager.NeglectMeter >= oBattleManager.MaxNeglect)
                    {
                        var Text = "Your ally is feeling neglected. He is too sad to attack!";
                        CreateBattleTextEvent(Text, false, new TextInit(0.05, c_black, 1));
                        Selected = false;
                    }
					else
					{
						ItemMouseHoverSelect = i;
						alarm[0] = 0.5*60/oBattleManager.SpeedMultiplier;
                    
	                    with(oBattleMenuBase)
						{
							scrAnimReinit(Animations.Flip, Animations.FadeOut);
							Selected = false;
						}
                    
	            		with(oBattleManager)
							DrawGUI = false;
					}
                }
                else
                {
                    var Text = "What the heck, '"+TextBox+"' aint no valid spell";
                    CreateBattleTextEvent(Text, false, new TextInit(0.05, c_black, 1));
                    Selected = false;
                }
                
            }
        }
        
        //Reset textbox
        TextBox = "";
        IsFocused = false;
    }
}