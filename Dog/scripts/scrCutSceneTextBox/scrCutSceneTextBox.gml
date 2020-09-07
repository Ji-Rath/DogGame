function scrCutSceneTextBox(argument0) {


	if(!instance_exists(oTextBox) && CreatedBox)
	{
	    scrCutSceneEnd();
	    CreatedBox = false;
	}
	else
	{
	    scrCreateTextBox(argument0);
	    CreatedBox = true;
	}


}
