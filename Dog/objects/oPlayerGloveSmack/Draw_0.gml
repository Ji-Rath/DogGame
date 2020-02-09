
switch(State)
{
    case 0:
        draw_sprite(AnimSprite[SpriteIndex],AnimIndex,x,y);
    break;
    
    case 1:
        var XEnemyPos, PlayerScale;
        if(AnimSwitch == 0)
        {
            XEnemyPos = -100;
            PlayerScale = 1;
        }
        else 
        {
            XEnemyPos = 100;
            PlayerScale = -1;
        }
        var EnemySprite;
        with(oBattleManager.Enemy)
        {
            EnemySprite = sprite_index
        }
        draw_sprite_ext(EnemySprite,0,x+XEnemyPos,y,0.5,0.5,0,c_white,1);
        draw_sprite_ext(sMiniGamePlayerGlovePlayer,AnimIndex,x,y,PlayerScale,1,0,c_white,1);
        draw_sprite(sMiniGamePlayerGloveButton,ButtonIndex,x,y-300);
    break;
}

