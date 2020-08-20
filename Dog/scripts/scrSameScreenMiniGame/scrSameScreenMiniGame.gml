/// @param GameType
function scrSameScreenMiniGame(argument0) {
	var GameType = argument0;

	var MiniGame = instance_create_layer(0,0,"GameManager",oMiniGame);
	MiniGame.GameType = GameType;
}
