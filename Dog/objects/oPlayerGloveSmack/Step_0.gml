
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
        if(input_check(EVerb.Interact))
        {
            AnimIndex = 1;
            AnimSwitch = choose(0,1);
            with(oBattleManager)
            {
                GetFocusedEnemy().Health -= 0.5;
            }
        }
        if(input_check_release(EVerb.Interact))
        {
            AnimIndex = 0;
        }
    break;
}

ButtonIndex += 0.25;

