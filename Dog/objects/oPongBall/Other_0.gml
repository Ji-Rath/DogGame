if (NotHit = true)
{
	scrFinishMiniGame(false);
	layer_sequence_play(oPaddle.PaddleGame);
	layer_sequence_headpos(oPaddle.PaddleGame,64);
}

if layer_sequence_is_finished(oPaddle.PaddleGame)
{
	layer_sequence_destroy(oPaddle.PaddleGame);
	cursor_sprite = -1;
}