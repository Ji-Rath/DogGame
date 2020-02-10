///@description create_textbox
///@arg text



var tbox = instance_create_layer(0,0,"text",obj_battlebox);

with(tbox)
{
	text = argument[0];
	
	
	var len = array_length_1d(text)

	event_perform(ev_other,ev_user1);
}

return tbox;