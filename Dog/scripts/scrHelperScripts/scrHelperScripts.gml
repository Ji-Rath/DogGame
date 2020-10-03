// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scrRunMiniGame(GameType) {
	var MiniGame = instance_create_layer(0,0,"GameManager",oMiniGame);
	MiniGame.GameType = GameType;
}