

if(!instance_exists(oTextBox) && CreatedBox)
{
    scrCutSceneEnd();
    CreatedBox = false;
}
else
{
    scrCreateTextBox(argument0,argument1,argument2);
    CreatedBox = true;
}