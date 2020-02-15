
switch(State)
{
    case 0:
        
        //Once one animation is done, go to next
        if (AnimIndex > sprite_get_number(AnimSprite[SpriteIndex]))
        {
            //Once animations are done, go to next state
            if(SpriteIndex < array_length_1d(AnimSprite)-1)
            {
                SpriteIndex++;
            }
            else
            {
                State++;
            }
            AnimIndex = 0;
        }
        //Increment animation
        AnimIndex += 0.5;
        
    break;
    
    case 1:
        //Action part
        if(global.KeyInteract)
        {
            AnimIndex = 1;
            AnimSwitch = choose(0,1);
            with(oBattleManager)
            {
                EnemyBattle.Health -= 1;
            }
        }
        if(global.KeyInteractRelease)
        {
            AnimIndex = 0;
        }
    break;
}

ButtonIndex += 0.25;

