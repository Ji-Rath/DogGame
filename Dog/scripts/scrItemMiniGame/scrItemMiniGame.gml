/// @param GameType
/// @param Cost = 0
/// @param ShowEnemy = false;
/// @param EndTurn = true
var GameType = argument[0];
var Cost = argument_count > 1 ? argument[1] : 0;
var EndTurn = argument_count > 2 ? argument[2] : true;
var ShowEnemy = argument_count > 3 ? argument[3] : false;;

var MiniGame = instance_create_layer(0,0,"GameManager",oMiniGame);
MiniGame.GameType = GameType;
global.pp -= Cost;
MiniGame.ShowEnemy = ShowEnemy;
MiniGame.EndTurn = EndTurn;