
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
    var ItemName, Description;
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
                    scrCreateBattleBox([Text], false);
                    Selected = false;
                    break;
                }
                
                var ExecuteArray = Description[4];
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
                
                break;
            }
            else
            {
                var Text = "What the heck, '"+TextBox+"' aint no valid ability";
                scrCreateBattleBox([Text], false);
                Selected = false;
                break;
            }
            
        }
    }
    
    //Reset textbox
    TextBox = "";
    IsFocused = false;
}
