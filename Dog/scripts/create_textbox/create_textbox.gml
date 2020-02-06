///@description create_textbox
///@arg text
///@arg speakers


var tbox = instance_create_layer(0,0,"text",obj_textbox);

with(tbox)
{
	text = argument[0];
	creator = argument[1];
	
	var len = array_length_1d(text)
	var i = 0;
	repeat(len)
	{
		face[i] = creator.portrait[i];
		portraits[i] = creator.portrait_index[i];
		i++
	}
	
	event_perform(ev_other,ev_user1);
}

return tbox;