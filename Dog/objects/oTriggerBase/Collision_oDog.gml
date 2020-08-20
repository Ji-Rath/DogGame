
if(!instance_exists(oCutScene) && !Used)
{
    scrCutScene(CutScene);
    if(OnlyUse)
        Used = true;
}