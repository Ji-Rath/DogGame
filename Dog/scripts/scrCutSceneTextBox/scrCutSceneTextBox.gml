
/// @param Text
/// @param TextInitialVal = array_create(array_length(Text), new TextInit())
/// @param TextExt = []
function scrCutSceneTextBox()
{
	var Text = argument[0];
var TextInitialVal = argument_count > 1 ? argument[1] : array_create(array_length(Text), new TextInit());
var TextExt = argument_count > 2 ? argument[2] : [];
	if(!instance_exists(oTextBox))
	{
		if(CreatedBox)
		{
		    scrCutSceneEnd();
		    CreatedBox = false;
		}
		else
		{
		    CreateTextEvent(Text, TextInitialVal, TextExt);
		    CreatedBox = true;
		}
	}
	
}
