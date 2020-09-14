

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
		   with(DogSave)
				physics_apply_force(x, y, 15, -10);
        }
		
    } else if(global.KeySprint)
    {
        if(StruggleRight)
        {
            StruggleRight = false;
            Counter++;
			with(DogSave)
				physics_apply_force(x, y, -15, -10);
        }
		
    }
}

if(!Complete && Counter >= CompleteCounter)
{
    Complete = true;
	DogSave.CanGrab = true;
	if(alarm[0] > 0.25*60)
		alarm[0] = 0.25*60;
    instance_destroy(ButtonAlternate);
}