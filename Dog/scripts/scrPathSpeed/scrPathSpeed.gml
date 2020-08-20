function scrPathSpeed() {
	if(path_index != -1)
	{
	    HSpeed = x-XPrevious;
	    VSpeed = y-YPrevious;
	    XPrevious = x;
	    YPrevious = y;
	}
}
