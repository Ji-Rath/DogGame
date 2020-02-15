
switch(State)
{
    case 0:
        draw_sprite(AnimSprite[SpriteIndex],AnimIndex,x,y);
    break;
    
    case 1:
        var XPlayerPos, PlayerScale;
        if(AnimSwitch == 0)
        {
            XPlayerPos = 100;
            PlayerScale = 1;
        }
        else 
        {
            XPlayerPos = -100;
            PlayerScale = -1;
        }
        var EnemySprite, Enemy;
        with(oBattleManager.EnemyBattle)
        {
            EnemySprite = sprite_index;
            Enemy = id;
        }
        //draw_sprite_ext(EnemySprite,0,x,y,0.5,0.5,0,c_white,1);
        draw_sprite_ext(sMiniGamePlayerGlovePlayer,AnimIndex,x+XPlayerPos,y,PlayerScale,1,0,c_white,1);
        draw_sprite(sMiniGamePlayerGloveButton,ButtonIndex,x,y+300);
    break;
}

