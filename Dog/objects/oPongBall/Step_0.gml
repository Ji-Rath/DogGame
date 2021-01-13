if (NotHit = true)
{
	x += xdirection;
	y += 5;
	image_xscale += 0.01;
	image_yscale = image_xscale;
}
else
{
	y-= 8;
	image_xscale -= 1;
	image_yscale = image_xscale;
}

if place_meeting(x,y,oPaddle)
{
	NotHit = false;
	scrFinishMiniGame(true);
	layer_sequence_play(oPaddle.PaddleGame);
	layer_sequence_headpos(oPaddle.PaddleGame,64);
}

if layer_sequence_is_finished(oPaddle.PaddleGame)
{
	layer_sequence_destroy(oPaddle.PaddleGame);
	cursor_sprite = -1;
}