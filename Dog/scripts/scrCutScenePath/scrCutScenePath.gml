function scrCutScenePath(argument0, argument1, argument2) {

	var Object = argument0, Path = argument1, Speed = argument2;

	with(Object)
	{
	    if(path_position = 1)
	    {
	        path_end();
	        HSpeed = 0;
	        VSpeed = 0;
	        other.OldX = 0;
	        other.OldY = 0;
	        scrCutSceneEnd();
	        exit;
	    }
    
	    if(path_index = -1)
	    {
	        path_start(Path,Speed,path_action_stop,true);
	    }
	}


}
