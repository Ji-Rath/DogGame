
if(!instance_exists(oCutScene) && !Used)
{
    var Scene = instance_create_layer(0,0,"Control",oCutScene);
    Scene.CutScene = CutScene;
    if(OnlyUse)
        Used = true;
}