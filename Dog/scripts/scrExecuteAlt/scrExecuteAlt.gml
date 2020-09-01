///@description scrExecuteAlt
///@arg [script,arg1,arg2,...]
function scrExecuteAlt(argument0) {

	var a = argument0;
	if(!is_array(a))
		a = array_create(1, a);
	var len = array_length(argument0);

	switch(len){
		case 0 : return; break;
		case 1 : script_execute(a[0]); break;
		case 2:  script_execute(a[0], a[1]); break;
		case 3:  script_execute(a[0], a[1], a[2]); break;
		case 4:  script_execute(a[0], a[1], a[2], a[3]); break;
		case 5:  script_execute(a[0], a[1], a[2], a[3], a[4]); break;
		case 6:  script_execute(a[0], a[1], a[2], a[3], a[4], a[5]); break;
		case 7:  script_execute(a[0], a[1], a[2], a[3], a[4], a[5], a[6]); break;
		case 8:  script_execute(a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7]); break;
		case 9:  script_execute(a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8]); break;
		case 10: script_execute(a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9]); break;
		case 11: script_execute(a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10]); break;
		case 12: script_execute(a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11]); break;
		case 13: script_execute(a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12]); break;
		case 14: script_execute(a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13]); break;
		case 15: script_execute(a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13], a[14]); break;
		case 16: script_execute(a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13], a[14], a[15]); break;
	}




}
