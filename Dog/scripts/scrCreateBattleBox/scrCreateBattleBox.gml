/// @param TextArray
/// @param EndTurn = true
var TextArray = argument[0];
var EndTurn = argument_count > 1 ? argument[1] : true;

if(!instance_exists(oBattleTextBox))
{
    var ObjectText = instance_create_layer(0,0,"text",oBattleTextBox);
    ObjectText.Text = TextArray;
    ObjectText.EndTurn = EndTurn;
}
else 
{
    ds_queue_enqueue(oBattleTextBox.TextQueue,TextArray);
}