function scrCutSceneTextBox(argument0)
{
	if(!instance_exists(oTextBox) && CreatedBox)
	{
	    scrCutSceneEnd();
	    CreatedBox = false;
	}
	else
	{
	    scrTextBox(argument0);
	    CreatedBox = true;
	}
}
