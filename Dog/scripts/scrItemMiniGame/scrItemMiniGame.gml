var MiniGame = instance_create_layer(0,0,"GameManager",oMiniGame);
MiniGame.GameType = Game.GlovesOff;

if(argument_count > 0)
{
    global.pp -= argument[0];
}