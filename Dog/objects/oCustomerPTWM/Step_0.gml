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
		CreateInstance((x - 5),(y- 10),oOrderPTWM)
		CreateInstance((oOrderPTWM.x),(oOrderPTWM.y),oFoodPTWM)
	}
	
if (Upset = true)
{
	global.PlayerHP -= 10;
	scrFinishMiniGame(false);
	Upset = false;
}

if (Satisfied = true)
{
	scrFinishMiniGame(true)
}