
//Have NPC go to path if not in a cutscene
if(path_index == -1 && !instance_exists(oCutScene))
{
    path_start(pathOldMan,Speed*2,path_action_restart,true);
}

//Go to cutscene if player gets near
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

