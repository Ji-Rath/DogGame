
/** Menu background, can be a sprite, or sequence */
SelectMenuBackground = sAttackMenu;

Selected = false;
IsHovering = false;
ItemMouseHover = false;
ItemMouseHoverSelect = 0;
MenuSequence = -1;

enum BattleState
{
    Idle,
    Attack,
    Finish
}

//Start invisible
image_index = SpriteIndex;
image_speed = 0;

//Contents of button
Contents = ds_list_create();

scrAnimInit(-1, Animations.FadeOut);
AnimAlpha = 0;

//Add available items to ds list
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