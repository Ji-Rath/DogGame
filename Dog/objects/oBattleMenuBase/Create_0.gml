
event_inherited();

function SortMenu()
{
	var Width = 750;
	var Interval = Width / instance_number(oBattleMenuBase);
	
	for	(var i=0;i<instance_number(oBattleMenuBase);i++)
	{
		// Appropriately distribute icons evenly
		var Inst = instance_find(oBattleMenuBase, i);
		var AlternatePos = (Interval * floor((i+1)/2)) * power(-1, i); //Start at center and alternate sign Interval
		var AdjustPos = (instance_number(oBattleMenuBase)-1)%2 * (Interval/2); //Account for odd number offset
		with (Inst)
		{
			x = room_width/2 + (AlternatePos + AdjustPos);
			y = room_height/1.25;
			//scrAnimInit(-1, Animations.FadeOut);
		}
	}
}
function CanPress()
{
	return oBattleManager.DrawGUI && !instance_exists(oMiniGame) && alarm[0] == -1;
}

SortMenu();

/** Menu background, can be a sprite, or sequence */
SelectMenuBackground = sAttackMenu;

Selected = false;
ItemMouseHover = false;
ItemMouseHoverSelect = 0;
MenuSequence = -1;

TweenSet(TWEEN_DEFAULT, "delta", true);
FadeOut = TweenCreate("$0.25", "y>", room_height, "image_alpha>", 0);
FadeIn = TweenCreate("$0.25", "y", room_height, y, "image_alpha>", 1);

enum BattleState
{
    Idle,
    Attack,
    Finish
}

//Start invisible
image_index = SpriteIndex;
image_speed = 0;
image_alpha = 0;

//Contents of button
Contents = ds_list_create();

//Add available items to ds list
for (var i=0;i<Item.LastItem;i++)
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