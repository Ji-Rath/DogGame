
for(i=0;i<ds_list_size(Contents);i++)
{
    var XPos = x+100
    var YPos = y-250+(i*75);
    ItemMouseHover = (point_in_rectangle(mouse_x, mouse_y, XPos-32, YPos-32, XPos+32, YPos+32));
    //If mouse is hovered over item, save item and end loop
    if(ItemMouseHover)
    {
        ItemMouseHoverSelect = i;
        i = ds_list_size(Contents)
    }
}