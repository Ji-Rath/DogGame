/**
with(oPlatformOneway) {
	
    if(round(other.bbox_bottom + 30)) > y+1 || (other.downjump == 1)
    {
        mask_index = -1;
    }
	else
	{
		mask_index = 1;
		
	}
	
}
	
*/
linecollide = (collision_line(x,bbox_bottom,x,bbox_bottom + 700,oReference,true,true))

bboxcollide = (place_meeting(x,bbox_bottom-78,oReference))


with(oPlatformOneway) {


	
	if (other.linecollide == -4) or (other.downjump == 1) or  (other.bboxcollide = 1)
	{
		
		mask_index = -1;
		
	}
	else
	{
		mask_index = sOneway;
		
	}
	
	

	

	
	
	
	
}

