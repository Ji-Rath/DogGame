
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
        if(keyboard_check_pressed(vk_space))
        {
            AnimIndex = 1;
            with(oBattleManager)
            {
                Enemy.Health -= 3;
            }
        }
        if(keyboard_check_released(vk_space))
        {
            AnimIndex = 0;
            AnimSwitch = choose(0,1);
        }
    break;
}

ButtonIndex += 0.25;

