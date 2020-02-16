
SpriteIndex = 0;
Selected = false;
IsHovering = false;
ItemMouseHover = false;
ItemMouseHoverSelect = 0;

enum Item
{
    GlovesOff,
    Punch,
    Hamburger
}

enum BattleState
{
    Idle,
    Attack,
    Finish
}

//Contents of button
Contents = ds_list_create();

//Start invisible
visible = false;

//Rotation when icon selected
RotValue = 0;
Rot = 0;