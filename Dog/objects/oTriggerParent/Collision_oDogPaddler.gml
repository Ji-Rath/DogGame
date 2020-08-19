
if(!instance_exists(oCutScene) && !Used)
{
    scrCreateCutScene(CutScene);
    if(OnlyUse)
        Used = true;
}