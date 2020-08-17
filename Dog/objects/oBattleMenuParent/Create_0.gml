
SpriteIndex = 0;
Selected = false;
IsHovering = false;
ItemMouseHover = false;
ItemMouseHoverSelect = 0;

enum BattleState
{
    Idle,
    Attack,
    Finish
}

//Start invisible
visible = false;

//Rotation when icon selected
RotValue = 0;
Rot = 0;

//Contents of button
Contents = ds_list_create();

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