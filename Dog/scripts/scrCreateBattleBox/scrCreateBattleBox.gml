/// @param TextArray
var TextArray = argument0;

if(!instance_exists(oBattleTextBox))
{
    var ObjectText = instance_create_layer(0,0,"text",oBattleTextBox);
    ObjectText.Text = TextArray;
}
else 
{
    ds_queue_enqueue(oBattleTextBox.TextQueue,TextArray);
}