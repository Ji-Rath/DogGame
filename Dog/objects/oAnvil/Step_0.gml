

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
        }
    } else if(global.KeySprint)
    {
        if(StruggleRight)
        {
            StruggleRight = false;
            Counter++;
        }
    }
}

if(!Complete && Counter >= CompleteCounter)
{
    Complete = true;
	DogSave.CanGrab = true;
    instance_destroy(ButtonAlternate);
}