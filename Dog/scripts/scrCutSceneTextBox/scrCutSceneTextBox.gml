
/// @param {string} TextFile
/// @param {string} Node
function scrCutSceneTextBox(TextFile, Node)
{
	if(!instance_exists(oTextBox))
	{
		if(CreatedBox)
		{
		    scrCutSceneEnd();
		    CreatedBox = false;
		}
		else
		{
		    CreateTextEvent(TextFile, Node);
		    CreatedBox = true;
		}
	}
}
