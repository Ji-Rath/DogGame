
if(!instance_exists(oCutScene))
{
    var Scene = instance_create_layer(0,0,"Control",oCutScene);
    Scene.CutScene = CutScene;
    instance_destroy();
}