
event_inherited();

//Draw textbox when book is selected
if(Selected)
{
    draw_rectangle(TextBoxX, TextBoxY, TextBoxX+TextBoxWidth, TextBoxY+TextBoxHeight,true);
    if(IsFocused)
    {
        draw_text(TextBoxX, TextBoxY+5, TextBox+LineIndicator);
    }
    else
    {
        draw_text(TextBoxX, TextBoxY, TextBox);
    }
    
}
