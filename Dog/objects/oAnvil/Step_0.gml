

if(global.KeyInteract)
{
    Interact = true;
}
if(global.KeyInteractRelease)
{
    Interact = false;
}

if(Counter < CompleteCounter)
{
    if(Interact)
    {
        if(!StruggleRight)
        {
           StruggleRight = true;
           Counter++;
		   DogSave.sprite_index = sRopeStruggle;
		   with(DogSave)
				physics_apply_force(x, y, 15, -10);
        }
		
    } else if(global.KeySprint)
    {
        if(StruggleRight)
        {
            StruggleRight = false;
            Counter++;
			DogSave.sprite_index = sRopeStruggle;
			with(DogSave)
				physics_apply_force(x, y, -15, -10);
        }
		
    }
}

if(!Complete && Counter >= CompleteCounter)
{
    Complete = true;
	DogSave.CanGrab = true;
	DogSave.sprite_index = sFree;
	DogSave.phy_rotation = 0;
	if(alarm[0] > 0.25*60)
		alarm[0] = 0.25*60;
    instance_destroy(ButtonAlternate);
}