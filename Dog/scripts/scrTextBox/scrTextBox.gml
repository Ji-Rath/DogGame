///@description scrTextBox(TextArray)
function scrTextBox(ArrayText)
{
	if(!instance_exists(oTextBox))
	{
		var TextBox = instance_create_layer(0,0,"Control",oTextBox);
		TextBox.TextArray = ArrayText;
	}


}

function scrBattleTextBox(TextArray, EndTurn)
{
	//Create textbox if it doesnt exist
	if(!instance_exists(oBattleTextBox))
	{
	    var ObjectText = instance_create_layer(0,0,"text",oBattleTextBox);
	    ObjectText.Text = TextArray;
	    ObjectText.EndTurn = EndTurn;
	}
	else 
	{
		//If object exists, add the text to the queue
	    ds_queue_enqueue(oBattleTextBox.TextQueue,TextArray);
	}
}
