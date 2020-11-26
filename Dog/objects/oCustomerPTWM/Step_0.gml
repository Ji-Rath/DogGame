// moves customer to point

if (CustomerMove = true)
	{
	layer_sequence_create("Instances",(room_width/2),(room_height/2),"seqPTWM_Enter")
		CustomerMove = false;
	}	
	var FIN = layer_sequence_get_sequence(seqPTWM_Enter) 
if layer_sequence_is_finished(FIN)
		{
		CustomerOrder = true;
		}
/////////////////////////

////// customer is ordering food

if (CustomerOrder = true)
	{
		instance_create_layer((x - 5),(y- 10), "Instances2", oOrderPTWM)
		instance_create_layer((oOrderPTWM.x),(oOrderPTWM.y),"Instances2",oFoodPTWM)
	}
	
if (Upset = true)
{
	global.PlayerHP -= 10;
	scrFinishMiniGame(false);
}