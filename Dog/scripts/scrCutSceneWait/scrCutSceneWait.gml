/// @param Time = 0
function scrCutSceneWait() {
	var Time = argument_count > 0 ? argument[0] : 0;

	//Turn time to miliseconds
	Time *= 60;

	//Increment time
	Timer++;

	if(Timer > Time)
	{
	    Timer = 0;
	    scrCutSceneEnd();
	}


}
