
if(distance_to_object(oDogPaddler) < 300 && !Used)
{
    path_end();
    HSpeed = 0;
    VSpeed = 0;
    scrCreateCutScene(CSWarning);
    Used = true;
}

//Movement
scrPathSpeed();
scrMoveCollision();
scrWalk();

