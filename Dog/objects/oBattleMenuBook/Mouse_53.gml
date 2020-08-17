
//Toggle focus for textbox
if(Selected && point_in_rectangle(mouse_x, mouse_y, TextBoxX, TextBoxY, TextBoxX+TextBoxWidth, TextBoxY+TextBoxHeight))
{
    IsFocused = true;
    LineIndicator = "|";
    keyboard_string = TextBox;
}
else
{
    IsFocused = false;
}