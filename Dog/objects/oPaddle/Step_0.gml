
x = mouse_x;
y = mouse_y;
if (Created = false)
{
	PaddleGame = layer_sequence_create("Instances",(room_width/2),(room_height/2),"seqPingPong")
	Created = true;
}

if (layer_sequence_get_headpos(PaddleGame) = 63)
{
	layer_sequence_headpos(PaddleGame,64);
	layer_sequence_pause(PaddleGame)
	with (oMiniGame)
	{
		CreateInstance((room_width/2+80),(room_height/2-150),oPongBall);
	}
}